//
//  ForecastViewController.m
//  CFuWx
//
//  Created by Erica Winberry on 12/18/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "ForecastViewController.h"
#import "DarkSkyAPI.h"
#import "Weather.h"
#import "HourlyTableViewCell.h"
#import "DailyTableViewCell.h"
#import "Conversions.h"

@interface ForecastViewController ()<UITableViewDelegate, UITableViewDataSource>

//properties
@property(strong, nonatomic) NSArray *hourlyWeatherArray;
@property(strong, nonatomic) NSArray *dailyWeatherArray;
@property(strong, nonatomic) NSString *forecastToDisplay;
@property(strong, nonatomic) HourlyTableViewCell *hourlyTableViewCell;
@property(strong, nonatomic) DailyTableViewCell *dailyTableViewCell;

//outlets
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeDateLabel;
@property (weak, nonatomic) IBOutlet UITableView *forecastTableView;

@end

@implementation ForecastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.forecastToDisplay = @"hourly";
    
    [self getWeatherData];
}

-(void)setHourlyWeather:(NSArray *)hourlyWeather {
    
    [self.forecastTableView reloadData];
    _hourlyWeatherArray = hourlyWeather;
}


-(void)getWeatherData {
    [DarkSkyAPI fetchDailyWeatherWithCompletion:^(NSArray *weatherArray) {
        self.dailyWeatherArray = weatherArray;
    }];
    [DarkSkyAPI fetchHourlyWeatherWithCompletion:^(NSArray *weatherArray) {
        self.hourlyWeatherArray = weatherArray;
    }];
}

//MARK: TableViewDelegate Methods

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.forecastToDisplay isEqual: @"hourly"]) {
        HourlyTableViewCell *hourlyCell = [tableView dequeueReusableCellWithIdentifier:@"HourlyTableViewCell" forIndexPath:indexPath];
        
        Weather *forecast = [self.hourlyWeatherArray objectAtIndex:indexPath.row];
        
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:[forecast.time doubleValue]];
        hourlyCell.hourlyTimeLabel.text = [Conversions convertToHourOnly:date];
        hourlyCell.hourlyTempLabel.text = [NSString stringWithFormat:@"%@°F", [Conversions formatToOneDecimal:forecast.temperature.floatValue]];
        hourlyCell.hourlyWindLabel.text = [NSString stringWithFormat:@"%@ mph", [Conversions formatToOneDecimal:forecast.windSpeed.floatValue]];
        hourlyCell.hourlyPrecipLabel.text = [NSString stringWithFormat:@"%ld\%%", (long)forecast.precipProbability.integerValue];
        hourlyCell.hourlyWxLabel.image = forecast.icon;
        
        return hourlyCell;
    } else {
        return nil;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.forecastToDisplay isEqualToString:@"hourly"]) {
        return self.hourlyWeatherArray.count;
    } else {
        return self.dailyWeatherArray.count;
    }
}


@end


/*
 code for background images from storm collection via unsplash
 
 -(UIImage *)getBackgroundImage {
 //setting background to image grabbed from "Storms" collection in unsplash.com
 NSURL *imageURL = [NSURL URLWithString:@"https://source.unsplash.com/collection/274155"];
 
 dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
 NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
 
 dispatch_async(dispatch_get_main_queue(), ^{
 // Update the UI
 self.backgroundImageView.image = [UIImage imageWithData:imageData];
 });
 });
 return self.backgroundImageView.image;
 }
 
 
 
 
 */




/*
 code for segue to this view controller(when forecast button in hamburger menu is pressed)
 
 
 ForecastViewController *forecastViewController = [[ForecastViewController alloc]init];
 [self presentViewController:forecastViewController animated:YES, completion:nil];
 
 
 */

//
//  ForecastViewController.m
//  CFuWx
//
//  Created by Erica Winberry on 12/18/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//
@import QuartzCore;
#import "ForecastViewController.h"
#import "DarkSkyAPI.h"
#import "Weather.h"
#import "HourlyTableViewCell.h"
#import "DailyTableViewCell.h"
#import "Conversions.h"
#import "LocationManager.h"

@interface ForecastViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

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
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end

@implementation ForecastViewController

- (IBAction)hourlyForecastButtonPressed:(UIButton *)sender {
    if([self.forecastToDisplay isEqualToString:@"daily"]) {
        self.forecastToDisplay = @"hourly";
        [self displayCorrectHeaders];
        [self.forecastTableView reloadData];
    }
}

- (IBAction)dailyForecastButtonPressed:(UIButton *)sender {
    if([self.forecastToDisplay isEqualToString:@"hourly"]) {
        self.forecastToDisplay = @"daily";
        [self displayCorrectHeaders];
        [self.forecastTableView reloadData];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Text Forecasts";
    
    self.forecastToDisplay = @"daily";
    
    self.forecastTableView.dataSource = self;
    self.forecastTableView.delegate = self;
    
    UINib *hourlyNib = [UINib nibWithNibName:@"HourlyTableViewCell" bundle:nil];
    [self.forecastTableView registerNib:hourlyNib forCellReuseIdentifier:@"HourlyTableViewCell"];
    UINib *dailyNib = [UINib nibWithNibName:@"DailyTableViewCell" bundle:nil];
    [self.forecastTableView registerNib:dailyNib forCellReuseIdentifier:@"DailyTableViewCell"];
    
    UINib *hourlyHeader = [UINib nibWithNibName:@"HourlyRowTitles" bundle:nil];
    [self.forecastTableView registerNib:hourlyHeader forCellReuseIdentifier:@"HourlyTableViewCellHeader"];
    
    UINib *dailyHeader = [UINib nibWithNibName:@"DailyRowTitles" bundle:nil];
    [self.forecastTableView registerNib:dailyHeader forCellReuseIdentifier:@"DailyTableViewCellHeader"];
    
    [self setNeedsStatusBarAppearanceUpdate];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSDate *date = [NSDate date];
    self.timeDateLabel.text = [NSString stringWithFormat:@"%@", [Conversions convertToReadableDate:date]];
    self.locationLabel.text = [self getLocationText];
    [self displayCorrectHeaders];
}

-(void)displayCorrectHeaders {
    if ([self.forecastToDisplay isEqualToString:@"daily"]) {
        [self getDailyWeatherData];
        self.forecastTableView.tableHeaderView = [[NSBundle mainBundle] loadNibNamed:@"DailyRowTitles" owner:self options:nil].firstObject;
        [self.forecastTableView reloadData];
    } else {
        [self getHourlyWeatherData];
        self.forecastTableView.tableHeaderView = [[NSBundle mainBundle] loadNibNamed:@"HourlyRowTitles" owner:self options:nil].firstObject;
        [self.forecastTableView reloadData];
    }
}

-(void)setHourlyWeatherArray:(NSMutableArray *)hourlyWeatherArray {
    [self.forecastTableView reloadData];
    _hourlyWeatherArray = hourlyWeatherArray;
}

-(void)getHourlyWeatherData {
    [DarkSkyAPI fetchHourlyWeatherWithCompletion:^(NSArray *weatherArray) {
        self.hourlyWeatherArray = weatherArray;
        [self getBackgroundImage];
        [self.forecastTableView reloadData];
    }];
}

-(void)getDailyWeatherData {
    [DarkSkyAPI fetchDailyWeatherWithCompletion:^(NSArray *weatherArray) {
        self.dailyWeatherArray = weatherArray;
        [self getBackgroundImage];
        [self.forecastTableView reloadData];
    }];
}

-(NSString *)getLocationText {
    CLLocation *location = [[LocationManager sharedManager] currentLocation];
    return [[LocationManager sharedManager] reverseGeocode:location];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

//MARK: TableViewDelegate Methods

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.forecastToDisplay isEqual: @"hourly"]) {
        HourlyTableViewCell *hourlyCell = [tableView dequeueReusableCellWithIdentifier:@"HourlyTableViewCell" forIndexPath:indexPath];
        
        Weather *forecast = [self.hourlyWeatherArray objectAtIndex:indexPath.row];
        
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:[forecast.time doubleValue]];
        hourlyCell.hourlyTimeLabel.text = [Conversions convertToHourAndMinutes:date];
        hourlyCell.hourlyTempLabel.text = [NSString stringWithFormat:@"%@°F", [Conversions formatToOneDecimal:forecast.temperature.floatValue]];
        hourlyCell.hourlyWindLabel.text = [NSString stringWithFormat:@"%@ mph", [Conversions formatToOneDecimal:forecast.windSpeed.floatValue]];
        hourlyCell.hourlyPrecipLabel.text = [NSString stringWithFormat:@"%@%%", [Conversions convertToPercentage:forecast.precipProbability.floatValue]];
        hourlyCell.hourlyWxLabel.image = forecast.icon;
        
        return hourlyCell;
        
    } else {
        DailyTableViewCell *dailyCell = [tableView dequeueReusableCellWithIdentifier:@"DailyTableViewCell" forIndexPath:indexPath];
        
        Weather *forecast = [self.dailyWeatherArray objectAtIndex:indexPath.row];
        
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:[forecast.time doubleValue]];
        dailyCell.dailyDayLabel.text = [Conversions convertToDayOnly:date];
        dailyCell.dailyHighLabel.text = [NSString stringWithFormat:@"%@°F", [Conversions formatToOneDecimal:forecast.temperatureMax.floatValue]];
        dailyCell.dailyLowLabel.text = [NSString stringWithFormat:@"%@°F", [Conversions formatToOneDecimal:forecast.temperatureMin.floatValue]];
        dailyCell.dailyWindLabel.text = [NSString stringWithFormat:@"%ld mph", (long)forecast.windSpeed.integerValue];
        dailyCell.dailyPrecipLabel.text = [NSString stringWithFormat:@"%@%%", [Conversions convertToPercentage:forecast.precipProbability.floatValue]];
        dailyCell.dailyWxLabel.image = forecast.icon;
        
        return dailyCell;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.forecastToDisplay isEqualToString:@"hourly"]) {
        return self.hourlyWeatherArray.count;
    } else {
        return self.dailyWeatherArray.count;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// still need to fix getting headers to display properly.
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if ([self.forecastToDisplay isEqualToString:@"hourly"]) {
        return [[NSBundle mainBundle] loadNibNamed:@"HourlyRowTitles" owner:self options:nil].firstObject;
        
    } else {
        return [[NSBundle mainBundle] loadNibNamed:@"DailyRowTitles" owner:self options:nil].firstObject;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 45;
//}

// code for background images from collections via unsplash
//-(NSURL *)getURLForLocalTimeOfForecast {
//    return [NSURL URLWithString:@"https://source.unsplash.com/collection/566474"];
//}


-(UIImage *)getBackgroundImage {
    //    setting background to image grabbed from "Forecast Backgrounds" collection in unsplash.com
    
    NSURL *imageURL = [[NSURL alloc] init];
    NSDate *date = [NSDate date];
    NSString *time = [Conversions convertToHourOnly:date];
    
    if (time.integerValue > 6 && time.integerValue < 18) {
        NSURL *dayURL = [NSURL URLWithString:@"https://source.unsplash.com/collection/566474"];
        imageURL = dayURL;
    } else {
        NSURL *nightURL = [NSURL URLWithString:@"https://source.unsplash.com/collection/791499"];
        imageURL = nightURL;
    }

//    NSURL *imageURL = [NSURL URLWithString:@"https://source.unsplash.com/collection/566474"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //            Update the UI
            self.backgroundImageView.image = [UIImage imageWithData:imageData];
        });
    });
    return self.backgroundImageView.image;
}
//


@end






/*
 code for segue to this view controller(when forecast button in hamburger menu is pressed)
 
 
 ForecastViewController *forecastViewController = [[ForecastViewController alloc]init];
 [self presentViewController:forecastViewController animated:YES, completion:nil];
 
 
 */

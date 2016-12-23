//
//  HomeViewController.m
//  CFuWx
//
//  Created by Erica Winberry on 12/18/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "HomeViewController.h"
#import "LocationManager.h"
#import "Altimeter.h"
#import "DarkSkyAPI.h"
#import "AppDelegate.h"
#import "Conversions.h"
#import "BurgerMenuViewController.h"
#import "ForecastViewController.h"
#import "SettingsViewController.h"

@import CoreLocation;

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) TopTableViewCell *topTableViewCell;
@property(strong, nonatomic) BottomTableViewCell *bottomTableViewCell;
@property(strong, nonatomic) Altimeter *altimeter;
@property(strong, nonatomic) LocationManager *locationManager;

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation HomeViewController

- (IBAction)forecastButtonPressed:(UIButton *)sender {
    UIStoryboard *forecastSB = [UIStoryboard storyboardWithName:@"Forecast" bundle:nil];
    
    ForecastViewController *forecastVC = [forecastSB instantiateViewControllerWithIdentifier:@"Forecast"];
    
    [self presentViewController:forecastVC animated:YES completion:nil];

}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.window.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"rickykharawala"]];
    [DarkSkyAPI createDarkSkyAuthURL:[DarkSkyAPI currentlyQuery]];
//    [[LocationManager alloc]init];
    
    self.altimeter = [[Altimeter alloc]init];
    
    // Core Location request permission for user's current location
    [[LocationManager sharedManager] requestPermissions];
    [[LocationManager sharedManager] requestLocation];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    
    
}

-(void)setupStoryboards {
    UIStoryboard *forecastSB = [UIStoryboard storyboardWithName:@"Forecast" bundle:nil];
    
    ForecastViewController *forecastVC = [forecastSB instantiateViewControllerWithIdentifier:@"Forecast"];
}


-(void)setCurrentWeather:(Weather *)currentWeather {
    
    [self.tableView reloadData];
    _currentWeather = currentWeather;
    
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row == 0) {
        TopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopTableViewCell"];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:[self.currentWeather.time doubleValue]];
        
        cell.date.text = [Conversions convertToReadableDate:date];
        cell.time.text = [Conversions convertToReadableTime:date];
        cell.temperature.text = [NSString stringWithFormat:@"%@°F", [Conversions formatToOneDecimal:self.currentWeather.temperature.floatValue]];
        cell.location.text = [[LocationManager sharedManager] reverseGeocode:[[LocationManager sharedManager] initialCLLocation]];
        [cell.weatherIconImage.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        cell.weatherIconImage.tintColor = [UIColor whiteColor];
        cell.weatherIconImage.image = self.currentWeather.icon;
        cell.summaryLabel.text = self.currentWeather.summary;
        return cell;
    }
    
    if(indexPath.row == 1) {
        BottomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BottomTableViewCell"];
        cell.pressure.text = [Conversions formatToTwoDecimals:self.currentWeather.pressure.floatValue];
        return cell;
    }
    return [[UITableViewCell alloc]init];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 195;
}

@end

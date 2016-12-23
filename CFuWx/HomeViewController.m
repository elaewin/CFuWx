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
    
    self.view.window.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"joy-stamp"]];
    
    self.altimeter = [[Altimeter alloc]init];
    
    // Core Location request permission for user's current location
    [[LocationManager sharedManager] requestPermissions];
    [[LocationManager sharedManager] requestLocation];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.tableView reloadData];
}

-(void)setCurrentWeather:(Weather *)currentWeather {
    _currentWeather = currentWeather;
    [self.tableView reloadData];
}

-(NSString *)getLocationText {
    CLLocation *location = [[LocationManager sharedManager] currentLocation];
    return [[LocationManager sharedManager] reverseGeocode:location];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row == 0) {
        TopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopTableViewCell"];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:[self.currentWeather.time doubleValue]];
        
        cell.time.text = [NSString stringWithFormat:@"Forecast at %@", [Conversions convertToReadableTime:date]];
        cell.date.text = [Conversions convertToReadableDate:date];
        cell.temperature.text = [NSString stringWithFormat:@"%@°F", [Conversions formatToOneDecimal:self.currentWeather.temperature.floatValue]];
        cell.location.text = [self getLocationText];
        [cell.weatherIconImage.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        cell.weatherIconImage.tintColor = [UIColor whiteColor];
        cell.weatherIconImage.image = self.currentWeather.icon;
        cell.summaryLabel.text = self.currentWeather.summary;
        return cell;
    }
    
    if(indexPath.row == 1) {
        BottomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BottomTableViewCell"];
        cell.pressure.text = [Conversions formatToTwoDecimals:self.currentWeather.pressure.floatValue];
        NSString *rH = [Conversions convertToPercentage: self.currentWeather.humidity.floatValue];
        cell.relativeHumidity.text = [NSString stringWithFormat:@"%@%%", rH];
        cell.apparentTemperature.text = [NSString stringWithFormat:@"%@°F", [Conversions formatToOneDecimal:self.currentWeather.apparentTemperature.floatValue]];
        if (![self.currentWeather.windSpeed isKindOfClass:[NSNumber class]]) {
            cell.windSpeed.text = @"Calm";
            cell.windDirection.text = @"";
        } else {
            cell.windSpeed.text = [NSString stringWithFormat:@"%@ mph", [Conversions formatToOneDecimal:self.currentWeather.windSpeed.floatValue]];
            cell.windDirection.text = [NSString stringWithFormat:@"(%@)", [Conversions windDirectionFromDegrees:self.currentWeather.windBearing.floatValue]];
        }
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

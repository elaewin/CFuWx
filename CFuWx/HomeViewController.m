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

@import CoreLocation;

@interface HomeViewController ()

@property(strong, nonatomic)Altimeter *altimeter;
@property(strong, nonatomic) LocationManager *locationManager;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Core Location request permission for user's current location
    [[LocationManager sharedManager] requestPermissions];
    [[LocationManager sharedManager] getCurrentLocationWithCoordinatesAndAltitude];
    
   // [[[LocationManager sharedManager] reverseGeocode:[LocationManager sharedManager] locationManager];
    CLLocation *location = [[CLLocation alloc]init];
    [[LocationManager sharedManager] reverseGeocode:location];
    NSLog(@"%@", location);
    Altimeter *altimeter = [[Altimeter alloc]init];
    [altimeter getAltitudeChange];
}


@end

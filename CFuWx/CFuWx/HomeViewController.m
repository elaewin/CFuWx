//
//  HomeViewController.m
//  CFuWx
//
//  Created by Erica Winberry on 12/18/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "HomeViewController.h"
#import "Altimiter.h"

@import CoreLocation;

@interface HomeViewController ()

@property(strong, nonatomic)Altimiter *altimeter;
@property(strong, nonatomic)CLLocationManager *locationManager;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Altimiter *altimeter = [[Altimiter alloc]init];
    [self.altimeter getAltitudeChange];
    
    // Core Location request permission for user's current location
    [self requestPermissions];
    [self getCurrentLocationWithCoordinatesAndAltitude];
}

-(void)requestPermissions {
    if ( ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) || ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted) ) {
        [self.locationManager requestWhenInUseAuthorization];
    } else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self setLocationManager:[[CLLocationManager alloc]init]];
        [CLLocationManager locationServicesEnabled];
    }
}

-(NSString *)getCurrentLocationWithCoordinatesAndAltitude {
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    
    NSString *currentLocation = [NSString stringWithFormat:@"latitude: %f longitude: %f altitude: %f", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude, self.locationManager.location.altitude]; //putting coordinates(lat/long) and altitude as floats into string
    
    NSLog(@"%@", currentLocation);
    
    return currentLocation;
}























































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end

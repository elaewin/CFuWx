//
//  HomeViewController.m
//  CFuWx
//
//  Created by Erica Winberry on 12/18/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "HomeViewController.h"
#import "Altimeter.h"

@import CoreLocation;

@interface HomeViewController ()

@property(strong, nonatomic)Altimeter *altimeter;
@property(strong, nonatomic)CLLocationManager *locationManager;
//@property(strong, nonatomic)CLGeocoder *gecoder;
@property(strong, nonatomic)CLPlacemark *placemark;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Core Location request permission for user's current location
    [self requestPermissions];
    [self getCurrentLocationWithCoordinatesAndAltitude];
    
    [self reverseGeocode:self.locationManager.location];
    
    Altimeter *altimeter = [[Altimeter alloc]init];
    [altimeter getAltitudeChange];
}

-(void)requestPermissions {
    if ( ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) || ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted) || ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) ) {
        NSLog(@"not authorized for location services");
        [self.locationManager requestWhenInUseAuthorization];
        //[self setLocationManager:[[CLLocationManager alloc]init]];
        //[CLLocationManager locationServicesEnabled];
    } else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse) {
        NSLog(@"authorized for location services");
        [self setLocationManager:[[CLLocationManager alloc]init]];
        [CLLocationManager locationServicesEnabled];
    }
}

-(NSString *)getCurrentLocationWithCoordinatesAndAltitude {
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    
    NSString *currentLocation = [NSString stringWithFormat:@"latitude: %f longitude: %f altitude: %f city: %@", self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude, self.locationManager.location.altitude, [self reverseGeocode:self.locationManager.location]]; //putting coordinates(lat/long) and altitude as floats into string
    
    NSLog(@"%@", currentLocation);
    
    return currentLocation;
}

-(NSString *)reverseGeocode:(CLLocation *)location {
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    //CLLocation *location = self.locationManager.location;
    
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        //NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        
        if (error == nil && [placemarks count] > 0) {
            _placemark = [placemarks lastObject];
            
            NSLog(@"city: %@", _placemark.locality);                    //city name
            NSLog(@"timeZone: %@", _placemark.timeZone);                //time zone
            NSLog(@"region: %@", _placemark.region);                    //CLCircularRegion(lat, long, radius(of region))
            NSLog(@"state: %@", _placemark.administrativeArea);         //state
            NSLog(@"county: %@", _placemark.subAdministrativeArea);     //county
            NSLog(@"country: %@", _placemark.country);                  //country
            NSLog(@"zip: %@", _placemark.postalCode);                   //zip code
        }
    }];
    return _placemark.locality;
}
@end

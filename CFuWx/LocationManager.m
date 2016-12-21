//
//  LocationManager.m
//  CFuWx
//
//  Created by Jacob Dobson on 12/20/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "LocationManager.h"

@interface LocationManager()

@property(strong, nonatomic)CLLocationManager *locationManager;
@property(strong, nonatomic)CLPlacemark *placemark;
@property(strong, nonatomic)CLLocation *coordinateLocation;

@end


@implementation LocationManager

+(instancetype)sharedManager {
    static LocationManager *sharedManager;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[LocationManager alloc]init];
    });
    return sharedManager;
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

//-(CLLocationCoordinate2D)returnCoordinate {
//    CLLocationCoordinate2D coordinate =
//    [CLLocationCoordinate2DMake([LocationManager sharedManager] locationManager.location.coordinate.latitude], ;
//    return coordinate;
//}



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

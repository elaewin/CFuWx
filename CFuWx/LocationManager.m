//
//  LocationManager.m
//  CFuWx
//
//  Created by Jacob Dobson on 12/20/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "LocationManager.h"
#import "DarkSkyAPI.h"

@interface LocationManager()<CLLocationManagerDelegate>

@property(strong, nonatomic)CLLocationManager *locationManager;
@property(strong, nonatomic)CLPlacemark *placemark;
@property(strong, nonatomic) CLLocation *currentLocation;

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

-(instancetype)init{
    self = [super init];

    if(self){
        _locationManager = [[CLLocationManager alloc]init];
        _locationManager.delegate = self;
        [self requestPermissions];
    }

    return self;
}

-(void)requestPermissions {
    if ( ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) || ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted) || ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) ) {
        NSLog(@"not authorized for location services");
        [_locationManager requestWhenInUseAuthorization];
        //[self setLocationManager:[[CLLocationManager alloc]init]];
        //[CLLocationManager locationServicesEnabled];
    } else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse) {
        NSLog(@"authorized for location services");
        [CLLocationManager locationServicesEnabled];
    }
}

-(void)requestLocation {
    self.locationManager.distanceFilter = 500;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager requestLocation];
}

-(CLLocationCoordinate2D)returnCurrentCoordinate {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(self.currentLocation.coordinate.latitude, self.currentLocation.coordinate.longitude);

//    NSLog(@"CURRENT COORDINATE: %@", self.currentLocation);

    return coordinate;
}

-(void)getLocationFrom:(NSString *)stringFromUser{
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];

    __weak typeof(self) bruce = self;

    [geocoder geocodeAddressString:stringFromUser completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        __strong typeof(bruce) hulk = bruce;
        if(placemarks.count > 0) {
            CLLocation *location = [[CLLocation alloc]init];
            hulk.currentLocation = location;
        }

    }];
}

-(NSString *)reverseGeocode:(CLLocation *)location {
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];

    __weak typeof(self) bruce = self;
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {

        __strong typeof(bruce) hulk = bruce;
        if (error == nil && [placemarks count] > 0) {
            hulk.placemark = [placemarks lastObject];
            

//            NSLog(@"city: %@", hulk.placemark.locality);                    //city name
//            NSLog(@"timeZone: %@", hulk.placemark.timeZone);                //time zone
//            NSLog(@"region: %@", hulk.placemark.region);                    //CLCircularRegion(lat, long, radius(of region))
//            NSLog(@"state: %@", hulk.placemark.administrativeArea);         //state
//            NSLog(@"county: %@", hulk.placemark.subAdministrativeArea);     //county
//            NSLog(@"country: %@", hulk.placemark.country);                  //country
//            NSLog(@"zip: %@", hulk.placemark.postalCode);                   //zip code
        }
    }];
    return [NSString stringWithFormat:@"%@, %@", self.placemark.locality, self.placemark.administrativeArea];
}

//MARK: SEATTLE COORDINATES

-(CLLocation *)initialCLLocation {
    CLLocation *seattle = [[CLLocation alloc]initWithLatitude:47.618335 longitude:-122.352264];
    return seattle;
}

//MARK: CLLocationManager Delegate Methods Go Here:

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    [self setCurrentLocation:locations.lastObject];

    
    // Need to refactor for any of the fetch methods.
//    NSLog(@"%@", self.currentLocation);
    [DarkSkyAPI fetchCurrentWeatherWithCompletion:^(Weather *weather) {
        NSLog(@"%@", weather);
    }];

}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    if(error){
        NSLog(@"%@", error.description);
    }
}











@end

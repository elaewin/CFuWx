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
    [DarkSkyAPI createDarkSkyAuthURL:[DarkSkyAPI currentlyQuery]];
}

-(CLLocationCoordinate2D)returnCurrentCoordinate {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(self.currentLocation.coordinate.latitude, self.currentLocation.coordinate.longitude);

    NSLog(@"%@", self.currentLocation);

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





//MARK: CLLocationManager Delegate Methods Go Here:



-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    [self setCurrentLocation:locations.lastObject];

    [DarkSkyAPI createDarkSkyAuthURL:[DarkSkyAPI currentlyQuery]];
    NSLog(@"%@", self.currentLocation);

}


-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    if(error){
        NSLog(@"%@", error.description);
    }
}











@end

//
//  LocationManager.h
//  CFuWx
//
//  Created by Jacob Dobson on 12/20/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import <Foundation/Foundation.h>

@import CoreLocation;

@interface LocationManager : NSObject

+(instancetype)sharedManager;
-(instancetype)init;
-(void)requestPermissions;
-(void)requestLocation;

-(void)getLocationFrom:(NSString *)stringFromUser;
-(CLLocationCoordinate2D)returnCurrentCoordinate;
-(NSString *)reverseGeocode:(CLLocation *)location;

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations;
@end

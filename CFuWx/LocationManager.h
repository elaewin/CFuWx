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

@property(strong, nonatomic) CLLocation *currentLocation;
@property(strong, nonatomic) NSString *timezone;
@property(strong, nonatomic) NSString *textLocation;

+(instancetype)sharedManager;

-(void)requestPermissions;
-(void)requestLocation;
-(CLLocationCoordinate2D)returnCurrentCoordinate;

-(void)getLocationFrom:(NSString *)stringFromUser;

-(NSString *)reverseGeocode:(CLLocation *)location;
-(CLLocation *)initialCLLocation;
-(CLLocation *)getLocationForLatitude:(double)latitude andLongitude:(double)longitude;

@end

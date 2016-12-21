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

-(void)requestPermissions;

-(NSString *)getCurrentLocationWithCoordinatesAndAltitude;

//-(CLLocationCoordinate2D)returnCoordinate;

-(NSString *)reverseGeocode:(CLLocation *)location;

@end

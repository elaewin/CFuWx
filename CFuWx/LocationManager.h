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
-(void)requestLocation;
-(CLLocationCoordinate2D)returnCurrentCoordinate;

-(void)getLocationFrom:(NSString *)stringFromUser;

-(NSString *)reverseGeocode:(CLLocation *)location;
@end

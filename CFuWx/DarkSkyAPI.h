//
//  DarkSkyAPI.h
//  CFuWx
//
//  Created by Corey Malek on 12/20/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Weather.h"
@import CoreLocation;

typedef void(^currentWeatherCompletion)(Weather *currentWeather);

@interface DarkSkyAPI : NSObject

+(NSURL *)createDarkSkyAuthURL:(NSURLQueryItem *)queryItem;
+(NSURL *)createAuthURLforLoad:(NSURLQueryItem *)queryItem withCoordinate:(CLLocationCoordinate2D)coordinate;
+(NSURLQueryItem *)currentlyQuery;
+(NSURLQueryItem *)hourlyQuery;
+(NSURLQueryItem *)dailyQuery;
+(void)fetchCurrentWeatherWithCompletion:(currentWeatherCompletion)completion;
+(void)fetchCurrentWeatherOnLoad:(currentWeatherCompletion)completion;

@end

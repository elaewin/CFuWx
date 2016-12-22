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

typedef void(^weatherCompletion)(Weather *weather);
typedef void(^weatherCompletionWithArray)(NSArray *weatherArray);


@interface DarkSkyAPI : NSObject

+(NSURL *)createDarkSkyAuthURL:(NSURLQueryItem *)queryItem;
+(NSURL *)createAuthURLforLoad:(NSURLQueryItem *)queryItem withCoordinate:(CLLocationCoordinate2D)coordinate;
+(NSURLQueryItem *)currentlyQuery;
+(NSURLQueryItem *)hourlyQuery;
+(NSURLQueryItem *)dailyQuery;
+(void)fetchCurrentWeatherWithCompletion:(weatherCompletion)completion;
+(void)fetchHourlyWeatherWithCompletion:(weatherCompletionWithArray)completion;
+(void)fetchDailyWeatherWithCompletion:(weatherCompletion)completion;
+(void)fetchCurrentWeatherOnLoad:(weatherCompletion)completion;

@end

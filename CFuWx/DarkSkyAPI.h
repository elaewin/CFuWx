//
//  DarkSkyAPI.h
//  CFuWx
//
//  Created by Corey Malek on 12/20/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface DarkSkyAPI : NSObject


+(NSURL *)createDarkSkyAuthURL:(NSURLQueryItem *)queryItem;
+(NSURLQueryItem *)currentlyQuery;
+(NSURLQueryItem *)hourlyQuery;
+(NSURLQueryItem *)dailyQuery;
+(void)fetchCurrentWeatherWithQuery;




@end

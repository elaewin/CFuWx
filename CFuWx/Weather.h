//
//  Weather.h
//  CFuWx
//
//  Created by Corey Malek on 12/21/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface Weather : NSObject

@property(strong, nonatomic) NSNumber *temperature;
@property(strong, nonatomic) NSNumber *apparentTemperature;
@property(strong, nonatomic) NSNumber *precipProbability;
@property(strong, nonatomic) NSNumber *humidity;
@property(strong, nonatomic) NSNumber *windSpeed;
@property(strong, nonatomic) NSNumber *windBearing;
@property(strong, nonatomic) NSNumber *pressure;
@property(strong, nonatomic) NSNumber *latitude;
@property(strong, nonatomic) NSNumber *longitude;
@property(strong, nonatomic) NSNumber *time;
@property(strong, nonatomic) NSNumber *temperatureMax;
@property(strong, nonatomic) NSNumber *temperatureMin;
@property(strong, nonatomic) NSNumber *sunriseTime;
@property(strong, nonatomic) NSNumber *sunsetTime;

@property(strong, nonatomic) NSString *summary;
@property(strong, nonatomic) UIImage *icon;
@property(strong, nonatomic) UIImage *backgroundImage;


@property(strong, nonatomic) NSDictionary *iconDictionary;


-(UIImage *)getWeatherIcon:(NSString *)iconName;
-(instancetype)initWithDictionary:(NSDictionary *)jsonDictionary andLatitude:(NSNumber *)latitude andLongitude:(NSNumber *)longitude;
@end

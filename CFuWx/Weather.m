//
//  Weather.m
//  CFuWx
//
//  Created by Corey Malek on 12/21/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "Weather.h"


@implementation Weather

-(instancetype)initWithDictionary:(NSDictionary *)jsonDictionary andLatitude:(NSNumber *)latitude andLongitude:(NSNumber *)longitude {
    self = [super init];
    
    if(self){
        _temperature = jsonDictionary[@"temperature"];
        _apparentTemperature = jsonDictionary[@"apparentTemperature"];
        _precipProbability = jsonDictionary[@"precipProbability"];
        _humidity = jsonDictionary[@"humidity"];
        _windSpeed = jsonDictionary[@"windSpeed"];
        _windBearing = jsonDictionary[@"windBearing"];
        _pressure = jsonDictionary[@"pressure"];
        _time = jsonDictionary[@"time"];
        _summary = jsonDictionary[@"summary"];
        _icon = [self getWeatherIcon:jsonDictionary[@"icon"]];
        _temperatureMax = jsonDictionary[@"temperatureMax"];
        _temperatureMin = jsonDictionary[@"temperatureMin"];
        _sunriseTime = jsonDictionary[@"sunriseTime"];
        _sunsetTime = jsonDictionary[@"sunsetTime"];
        _latitude = latitude;
        _longitude = longitude;
        _backgroundImage = [self getBackgroundImage:jsonDictionary[@"icon"]];
        }
    return self;
}


-(UIImage *)getWeatherIcon:(NSString *)iconName {
    
    NSDictionary *iconDictionary = @{@"clear-day": [UIImage imageNamed:@"clear-day"], @"clear-night": [UIImage imageNamed:@"clear-night"], @"rain": [UIImage imageNamed:@"rain"], @"snow": [UIImage imageNamed:@"snow"], @"sleet": [UIImage imageNamed:@"sleet"], @"wind": [UIImage imageNamed:@"wind"], @"fog": [UIImage imageNamed:@"fog"], @"cloudy": [UIImage imageNamed:@"cloudy"], @"partly-cloudy-day": [UIImage imageNamed:@"partly-cloudy-day"], @"partly-cloudy-night": [UIImage imageNamed:@"partly-cloudy-night"]};
    
    return [iconDictionary objectForKey:iconName];

}

-(UIImage *)getBackgroundImage:(NSString *)iconName {
    NSDictionary *imageDictionary = @{@"clear-day": [UIImage imageNamed:@"clear-day-photo"], @"clear-night": [UIImage imageNamed:@"clear-night-photo"], @"rain": [UIImage imageNamed:@"rain-photo"], @"snow": [UIImage imageNamed:@"snow-photo"], @"sleet": [UIImage imageNamed:@"sleet-photo"], @"wind": [UIImage imageNamed:@"wind-photo"], @"fog": [UIImage imageNamed:@"fog-photo"], @"cloudy": [UIImage imageNamed:@"cloudy-photo"], @"partly-cloudy-day": [UIImage imageNamed:@"partly-cloudy-day-photo"], @"partly-cloudy-night": [UIImage imageNamed:@"partly-cloudy-night-photo"]};
    
    return [imageDictionary objectForKey:iconName];
}


@end

//
//  Weather.m
//  CFuWx
//
//  Created by Corey Malek on 12/21/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "Weather.h"


@implementation Weather



-(instancetype)initWithDictionary:(NSDictionary *)jsonDictionary{
    self = [super init];
    
    if (self) {
        _temperature = jsonDictionary[@"currently.temperature"];
        _precipProbability = jsonDictionary[@"currently.precipProbability"];
        _humidity = jsonDictionary[@"currently.humidity"];
        _windSpeed = jsonDictionary[@"currently.windSpeed"];
        _windBearing = jsonDictionary[@"currently.windBearing"];
        _pressure = jsonDictionary[@"currently.pressure"];
        _time = jsonDictionary[@"currently.time"];
        
        _summary = jsonDictionary[@"currently.summary"];
        _icon = [self getWeatherIcon:@"currently.icon"];
    }
    
    return self;
}


-(UIImage *)getWeatherIcon:(NSString *)iconName {
    
    NSDictionary *iconDictionary = @{@"clear-day": [UIImage imageNamed:@"clear-day"], @"clear-night": [UIImage imageNamed:@"clear-night"], @"rain": [UIImage imageNamed:@"rain"], @"snow": [UIImage imageNamed:@"snow"], @"sleet": [UIImage imageNamed:@"sleet"], @"wind": [UIImage imageNamed:@"wind"], @"fog": [UIImage imageNamed:@"fog"], @"cloudy": [UIImage imageNamed:@"cloudy"], @"partly-cloudy-day": [UIImage imageNamed:@"partly-cloudy-day"], @"partly-cloudy-night": [UIImage imageNamed:@"partly-cloudy-night"]};
    
    return [iconDictionary objectForKey:iconName];

}









@end

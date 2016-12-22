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
    
    if(self){
        _latitude = jsonDictionary[@"latitude"];
        _longitude = jsonDictionary[@"longitude"];
        _temperature = [jsonDictionary valueForKey:@"temperature"];
        _precipProbability = [jsonDictionary valueForKey:@"precipProbability"];
        _humidity = [jsonDictionary valueForKey:@"humidity"];
        _windSpeed = [jsonDictionary valueForKey:@"windSpeed"];
        _windBearing = [jsonDictionary valueForKey:@"windBearing"];
        _pressure = [jsonDictionary valueForKey:@"pressure"];
        _time = [jsonDictionary valueForKey:@"time"];
        _summary = [jsonDictionary valueForKey:@"summary"];
        _icon = [self getWeatherIcon:[jsonDictionary valueForKey:@"icon"]];
        _temperatureMax = [jsonDictionary valueForKey:@"temperatureMax"];
        _temperatureMin = [jsonDictionary valueForKey:@"temperatureMin"];
        }
    return self;
}


-(UIImage *)getWeatherIcon:(NSString *)iconName {
    
    NSDictionary *iconDictionary = @{@"clear-day": [UIImage imageNamed:@"clear-day"], @"clear-night": [UIImage imageNamed:@"clear-night"], @"rain": [UIImage imageNamed:@"rain"], @"snow": [UIImage imageNamed:@"snow"], @"sleet": [UIImage imageNamed:@"sleet"], @"wind": [UIImage imageNamed:@"wind"], @"fog": [UIImage imageNamed:@"fog"], @"cloudy": [UIImage imageNamed:@"cloudy"], @"partly-cloudy-day": [UIImage imageNamed:@"partly-cloudy-day"], @"partly-cloudy-night": [UIImage imageNamed:@"partly-cloudy-night"]};
    
    return [iconDictionary objectForKey:iconName];

}









@end

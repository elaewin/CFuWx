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
    
    
    
        _temperature = [jsonDictionary valueForKeyPath:@"currently.temperature"];
        _precipProbability = [jsonDictionary valueForKeyPath:@"currently.precipProbability"];
        _humidity = [jsonDictionary valueForKeyPath:@"currently.humidity"];
        _windSpeed = [jsonDictionary valueForKeyPath:@"currently.windSpeed"];
        _windBearing = [jsonDictionary valueForKeyPath:@"currently.windBearing"];
        _pressure = [jsonDictionary valueForKeyPath:@"currently.pressure"];
        _time = [jsonDictionary valueForKeyPath:@"currently.time"];
        
        _summary = [jsonDictionary valueForKeyPath:@"currently.summary"];
        _icon = [self getWeatherIcon:@"currently.icon"];
    
    
    }
    
    return self;
    
}


-(UIImage *)getWeatherIcon:(NSString *)iconName {
    
    NSDictionary *iconDictionary = @{@"clear-day": [UIImage imageNamed:@"clear-day"], @"clear-night": [UIImage imageNamed:@"clear-night"], @"rain": [UIImage imageNamed:@"rain"], @"snow": [UIImage imageNamed:@"snow"], @"sleet": [UIImage imageNamed:@"sleet"], @"wind": [UIImage imageNamed:@"wind"], @"fog": [UIImage imageNamed:@"fog"], @"cloudy": [UIImage imageNamed:@"cloudy"], @"partly-cloudy-day": [UIImage imageNamed:@"partly-cloudy-day"], @"partly-cloudy-night": [UIImage imageNamed:@"partly-cloudy-night"]};
    
    return [iconDictionary objectForKey:iconName];

}









@end

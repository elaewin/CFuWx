//
//  Weather.m
//  CFuWx
//
//  Created by Corey Malek on 12/21/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "Weather.h"


@implementation Weather



-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    
    //remember to change these to corresponding JSON object
    if(self) {
        self.temperature = @"temperature";
        self.precipProbability = @"precipProbability";
        self.humidity = @"humidity";
        self.windSpeed = @"windSpeed";
        self.windBearing = @"windBearing";
        self.pressure = @"pressure";
        self.time = @"time";
        
        self.summary = @"summary";
        self.icon = [self getWeatherIcon:@"icon"];
        
    }
    
    return self;
    
}


-(UIImage *)getWeatherIcon:(NSString *)iconName {
    
    NSDictionary *iconDictionary = @{@"clear-day": [UIImage imageNamed:@"clear-day"], @"clear-night": [UIImage imageNamed:@"clear-night"], @"rain": [UIImage imageNamed:@"rain"], @"snow": [UIImage imageNamed:@"snow"], @"sleet": [UIImage imageNamed:@"sleet"], @"wind": [UIImage imageNamed:@"wind"], @"fog": [UIImage imageNamed:@"fog"], @"cloudy": [UIImage imageNamed:@"cloudy"], @"partly-cloudy-day": [UIImage imageNamed:@"partly-cloudy-day"], @"partly-cloudy-night": [UIImage imageNamed:@"partly-cloudy-night"]};
    
    return [iconDictionary objectForKey:iconName];

}









@end

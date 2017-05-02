//
//  DarkSkyAPI.m
//  CFuWx
//
//  Created by Corey Malek on 12/20/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "DarkSkyAPI.h"
#import "Credentials.h"
#import "AppDelegate.h"
#import "HomeViewController.h"
#import "LocationManager.h"

@import CoreLocation;


NSString *kBaseURL = @"https://api.darkysky.net/forecast/";

@interface DarkSkyAPI()

@property(nonatomic) CLLocationCoordinate2D coordinate;
@property(strong, nonatomic) NSMutableData *receivedData;
@property(strong, nonatomic) NSURLConnection *requestURL;

@end


@implementation DarkSkyAPI

// MARK: URL Components/Creation Methods

+(NSURL *)createDarkSkyAuthURL:(NSURLQueryItem *)queryItem {
    CLLocationCoordinate2D coordinate = [[LocationManager sharedManager] returnCurrentCoordinate];
    NSURLComponents *components = [[NSURLComponents alloc]init];
    components.scheme = @"https";
    components.host = @"api.darksky.net";
    components.path = [NSString stringWithFormat:@"/forecast/%@/%f,%f", kDarkSkyAPIKey, coordinate.latitude, coordinate.longitude];
    components.queryItems = @[queryItem];
    NSURL *url = components.URL;
    return url;
}

+(NSURL *)createAuthURLforLoad:(NSURLQueryItem *)queryItem withCoordinate:(CLLocationCoordinate2D)coordinate {
    NSURLComponents *components = [[NSURLComponents alloc]init];
    components.scheme = @"https";
    components.host = @"api.darksky.net";
//    components.path = [NSString stringWithFormat:@"/forecast/%@/%f,%f", @"key", coordinate.latitude, coordinate.longitude];
    components.path = [NSString stringWithFormat:@"/forecast/%@/%f,%f", kDarkSkyAPIKey, coordinate.latitude, coordinate.longitude];
    components.queryItems = @[queryItem];
    NSURL *url = components.URL;
    return url;
}

+(NSURLQueryItem *)currentlyQuery {
    NSURLQueryItem *excludeQueryItem = [NSURLQueryItem queryItemWithName:@"exclude" value:@"minutely,hourly,daily,alerts,flags"];
    return excludeQueryItem;
}

+(NSURLQueryItem *)hourlyQuery {
    NSURLQueryItem *excludeQueryItem = [NSURLQueryItem queryItemWithName:@"exclude" value:@"currently,minutely,daily,flags"];
    return excludeQueryItem;
}

+(NSURLQueryItem *)dailyQuery {
    NSURLQueryItem *excludeQueryItem = [NSURLQueryItem queryItemWithName:@"exclude" value:@"currently,minutely,hourly,flags"];
    return excludeQueryItem;
}

// API Fetch Methods
+(void)fetchCurrentWeatherWithCompletion:(weatherCompletion)completion {

    NSURL *url = [self createDarkSkyAuthURL:[self currentlyQuery]];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(error) {
            NSLog(@"There was a problem getting current weather data from API - Error: %@", error.localizedDescription);
        }
        
        if(data) {
            NSError *jsonParsingError;
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonParsingError];
//            NSLog(@"JSON LOADS FOR CURRENT WEATHER");
            if (error) {
                NSLog(@"Error Parsing JSON - Error: %@", jsonParsingError.localizedDescription);
            } else {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    Weather *currentWeather = [[Weather alloc]initWithDictionary:[json valueForKey:@"currently"] andLatitude:json[@"latitude"] andLongitude:json[@"longitude"]];
                    completion(currentWeather);
                }];
            }
        }
    }] resume];
}

+(void)fetchHourlyWeatherWithCompletion:(weatherCompletionWithArray)completion {
    NSURL *url = [self createDarkSkyAuthURL:[self hourlyQuery]];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if(error) {
            NSLog(@"There was a problem getting hourly weather data from API - Error: %@", error.localizedDescription);
        }
        
        if(data) {
            NSError *jsonParsingError;
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonParsingError];
//            NSLog(@"JSON LOADS FOR HOURLY WEATHER");
            if (error) {
                NSLog(@"Error Parsing JSON - Error: %@", jsonParsingError.localizedDescription);
            } else {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    NSMutableArray *hourlyArray = [[NSMutableArray alloc]init];
                    
                    for (NSDictionary *hourlyForecast in [json valueForKeyPath:@"hourly.data"]) {
                        Weather *hourlyWeather = [[Weather alloc]initWithDictionary:hourlyForecast andLatitude:json[@"latitude"] andLongitude:json[@"longitude"]];
                        [hourlyArray addObject:hourlyWeather];
                    }
                    completion(hourlyArray);
                }];
            }
        }
    }] resume];
}

+(void)fetchDailyWeatherWithCompletion:(weatherCompletionWithArray)completion {
    
    NSURL *url = [self createDarkSkyAuthURL:[self dailyQuery]];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Response: %@", response);
        
        if(error) {
            NSLog(@"There was a problem getting current weather data from API - Error: %@", error.localizedDescription);
        }
        
        if(data) {
            NSError *jsonParsingError;
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonParsingError];
//            NSLog(@"JSON!: %@", json);
            if (error) {
                NSLog(@"Error Parsing JSON - Error: %@", jsonParsingError.localizedDescription);
            } else {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    NSMutableArray *dailyArray = [[NSMutableArray alloc]init];
                    
                    for (NSDictionary *dailyForecast in [json valueForKeyPath:@"daily.data"]) {
//                        NSLog(@"forecast Icon for daily forecast: %@", dailyForecast[@"icon"]);
                        Weather *dailyWeather = [[Weather alloc]initWithDictionary:dailyForecast andLatitude:json[@"latitude"] andLongitude:json[@"longitude"]];
                        [dailyArray addObject:dailyWeather];
                    }
                    completion(dailyArray);
                }];
            }
        }
    }] resume];
}

// MARK: Fetch on Load methods

+(CLLocationCoordinate2D)getOnLoadCoordinate {
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(47.618335, -122.352264);
    return coordinate;
}


+(void)fetchCurrentWeatherOnLoad:(weatherCompletion)completion {
    NSURL *url = [self createAuthURLforLoad:[self currentlyQuery] withCoordinate:[self getOnLoadCoordinate]];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        NSLog(@"Response: %@", response);
        
        if(error) {
            NSLog(@"There was a problem getting weather data from API - Error: %@", error.localizedDescription);
        }
        
        if(data) {
            NSError *jsonParsingError;
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonParsingError];
//            NSLog(@"JSON!: %@", json);
            if (error) {
                NSLog(@"Error Parsing JSON - Error: %@", jsonParsingError.localizedDescription);
            } else {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                     Weather *currentWeather = [[Weather alloc]initWithDictionary:[json valueForKey:@"currently"] andLatitude:json[@"latitude"] andLongitude:json[@"longitude"]];
                    completion(currentWeather);
                }];
            }
        }
    }] resume];
}

@end

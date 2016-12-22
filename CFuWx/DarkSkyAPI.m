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
    NSLog(@"COMPONENTS URL: %@", components.URL);
    return url;
}

+(NSURL *)createAuthURLforLoad:(NSURLQueryItem *)queryItem withCoordinate:(CLLocationCoordinate2D)coordinate {
    NSURLComponents *components = [[NSURLComponents alloc]init];
    components.scheme = @"https";
    components.host = @"api.darksky.net";
    components.path = [NSString stringWithFormat:@"/forecast/%@/%f,%f", kDarkSkyAPIKey, coordinate.latitude, coordinate.longitude];
    components.queryItems = @[queryItem];
    NSURL *url = components.URL;
    NSLog(@"COMPONENTS URL: %@", components.URL);
    return url;
}

+(NSURLQueryItem *)currentlyQuery {
    NSURLQueryItem *excludeQueryItem = [NSURLQueryItem queryItemWithName:@"exclude" value:@"minutely,hourly,daily,alerts,flag"];
    return excludeQueryItem;
}

+(NSURLQueryItem *)hourlyQuery {
    NSURLQueryItem *excludeQueryItem = [NSURLQueryItem queryItemWithName:@"exclude" value:@"currently,minutely,daily,flag"];
    return excludeQueryItem;
}

+(NSURLQueryItem *)dailyQuery {
    NSURLQueryItem *excludeQueryItem = [NSURLQueryItem queryItemWithName:@"exclude" value:@"currently,minutely,hourly,flag"];
    return excludeQueryItem;
}

// API Fetch Methods
+(void)fetchCurrentWeatherWithCompletion:(weatherCompletion)completion {
    NSURL *url = [self createDarkSkyAuthURL:[self currentlyQuery]];
    
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
            NSLog(@"JSON!!!!!: %@", json);
            if (error) {
                NSLog(@"Error Parsing JSON - Error: %@", jsonParsingError.localizedDescription);
            } else {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    Weather *currentWeather = [[Weather alloc]initWithDictionary:json];
                    completion(currentWeather);
                }];
            }
        }
    }] resume];
}

+(void)fetchHourlyWeatherWithCompletion:(weatherCompletion)completion {
    NSURL *url = [self createDarkSkyAuthURL:[self hourlyQuery]];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Response: %@", response);
        
        if(error) {
            NSLog(@"There was a problem getting hourly weather data from API - Error: %@", error.localizedDescription);
        }
        
        if(data) {
            NSError *jsonParsingError;
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonParsingError];
            NSLog(@"JSON!!!!!: %@", json);
            if (error) {
                NSLog(@"Error Parsing JSON - Error: %@", jsonParsingError.localizedDescription);
            } else {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    Weather *currentWeather = [[Weather alloc]initWithDictionary:json];
                    completion(currentWeather);
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
        NSLog(@"Response: %@", response);
        
        if(error) {
            NSLog(@"There was a problem getting weather data from API - Error: %@", error.localizedDescription);
        }
        
        if(data) {
            NSError *jsonParsingError;
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                                 options:NSJSONReadingMutableContainers
                                                                   error:&jsonParsingError];
            NSLog(@"JSON!!!!!: %@", json);
            if (error) {
                NSLog(@"Error Parsing JSON - Error: %@", jsonParsingError.localizedDescription);
            } else {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    Weather *currentWeather = [[Weather alloc]initWithDictionary:json];
                    completion(currentWeather);
                }];
            }
        }
    }] resume];
}

@end





















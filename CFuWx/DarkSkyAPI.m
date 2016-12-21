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

+(NSURL *)createDarkSkyAuthURL:(NSURLQueryItem *)queryItem {
    CLLocationCoordinate2D coordinate = [[LocationManager sharedManager] returnCurrentCoordinate];
    NSURLComponents *components = [[NSURLComponents alloc]init];
    components.scheme = @"https";
    components.host = @"api.darksky.net";
    components.path = [NSString stringWithFormat:@"/forecast/%@/%f,%f", kDarkSkyAPIKey, coordinate.latitude, coordinate.longitude];
    components.queryItems = @[queryItem];
    NSURL *url = components.URL;
    NSLog(@"%@", components.URL);
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


+(void)fetchCurrentWeatherWith:(NSDictionary *)weatherDictionary{
    
    
    
    
}

+(void)fetchForecast:(CLLocationCoordinate2D) coordinate{
   
//    NSString *baseURL = @"https://api.darkysky.net/forecast/";
//    NSString *requestURL = [NSString stringWithFormat:@"%@%@/%f,%f", baseURL,kDarkSkyAPIKey, coordinate.latitude, coordinate.longitude];
//    
//    NSLog(@"%@", requestURL);
    
}


//-(NSMutableData *)receivedData {
//    if(!_receivedData){
//        _receivedData = [[NSMutableData alloc]init];
//        
////        [HomeViewController ]
//    }
//    return _receivedData;
//}
//
//-(NSURLConnection *)requestURL {
//    if (!_requestURL) {
//        _requestURL = [[NSURLConnection alloc]init];
//    }
//    return _requestURL;
//}


//-(void)httpRequest:(NSURL *)url{
//    NSURLSession *session = [NSURLSession sharedSession];
//    [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//        if(!error){
//            [self.delegate fetchData:data sender:self];
//            self.delegate = nil;
//        } else {
//            NSLog(@"Error Fetching Data");
//            
//        }
//    }];
//}



//-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
//    [self.receivedData appendData:data];
//}



//-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
//     //setting to 'nil' will ensure that once the method makes connection to API, it will refresh and instantiate again when needed (see setter methods)
//    self.receivedData = nil;
//    self.requestURL = nil;
//}



@end





















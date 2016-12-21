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
@import CoreLocation;

@interface DarkSkyAPI()

@property(strong, nonatomic) NSMutableData *receivedData;
@property(strong, nonatomic) NSURLConnection *requestURL;

@end


@implementation DarkSkyAPI

+(void)fetchForecast:(CLLocationCoordinate2D) coordinate{
   
    NSString *baseURL = @"https://api.darkysky.net/forecast/";
    NSString *requestURL = [NSString stringWithFormat:@"%@%@/%f,%f", baseURL,kDarkSkyAPIKey, coordinate.latitude, coordinate.longitude];
    
    NSLog(@"%@", requestURL);
    
}


-(NSMutableData *)receivedData {
    if(!_receivedData){
        _receivedData = [[NSMutableData alloc]init];
        
//        [HomeViewController ]
    }
    return _receivedData;
}

-(NSURLConnection *)requestURL {
    if (!_requestURL) {
        _requestURL = [[NSURLConnection alloc]init];
    }
    return _requestURL;
}


-(void)httpRequest:(NSURL *)url{
    NSURLSession *session = [NSURLSession sharedSession];
    [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if(!error){
            [self.delegate fetchData:data sender:self];
            self.delegate = nil;
        } else {
            NSLog(@"Error Fetching Data");
            
        }
    }];
}



-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.receivedData appendData:data];
}



-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
     //setting to 'nil' will ensure that once the method makes connection to API, it will refresh and instantiate again when needed (see setter methods)
    self.receivedData = nil;
    self.requestURL = nil;
}



@end





















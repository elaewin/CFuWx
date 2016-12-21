//
//  DarkSkyAPI.h
//  CFuWx
//
//  Created by Corey Malek on 12/20/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class DarkSkyAPI;
@protocol DarkSkyAPIDelegate <NSObject>

-(void)fetchData: (NSMutableData *)data sender:(DarkSkyAPI *)sender;

@end


//public method: 
@interface DarkSkyAPI : NSObject


+(NSURL *)createDarkSkyAuthURL:(NSURLQueryItem *)queryItem;
+(NSURLQueryItem *)currentlyQuery;



-(void)httpRequest:(NSURL *)url;

+(void)fetchForecast:(CGFloat)latitude andLong:(CGFloat)longitude;

@property(weak, nonatomic) id <DarkSkyAPIDelegate> delegate;

@end

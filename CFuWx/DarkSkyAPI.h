//
//  DarkSkyAPI.h
//  CFuWx
//
//  Created by Corey Malek on 12/20/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DarkSkyAPI;
@protocol DarkSkyAPIDelegate <NSObject>

-(void)fetchData: (NSMutableData *)data sender:(DarkSkyAPI *)sender;

@end


//public method: 
@interface DarkSkyAPI : NSObject
-(void)httpRequest:(NSURL *)url;

@property(weak, nonatomic) id <DarkSkyAPIDelegate> delegate;

@end

//
//  Altimiter.m
//  CFuWx
//
//  Created by Corey Malek on 12/19/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "Altimiter.h"

@interface Altimiter ()

@property(strong, nonatomic) CMAltimeter *altimeter;


@end
@implementation Altimiter



-(void)getAltitudeChange{
    if([CMAltimeter isRelativeAltitudeAvailable]) {
//        NSOperationQueue *altitudeQueue = [[NSOperationQueue alloc]init];

        self.altimeter = [[CMAltimeter alloc]init];
        [self.altimeter startRelativeAltitudeUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAltitudeData * _Nullable altitudeData, NSError * _Nullable error) {
            NSLog(@"Pressure: %.4f", altitudeData.pressure.floatValue);
        }];
        
    } else {
        NSLog(@"Error");
    }
}



@end

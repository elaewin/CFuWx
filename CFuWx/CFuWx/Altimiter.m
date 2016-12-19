//
//  Altimiter.m
//  CFuWx
//
//  Created by Corey Malek on 12/19/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "Altimiter.h"

@implementation Altimiter



-(void)getAltitudeChange{
    if([CMAltimeter isRelativeAltitudeAvailable]) {
//        NSOperationQueue *altitudeQueue = [[NSOperationQueue alloc]init];

        CMAltimeter *altimeter = [[CMAltimeter alloc]init];
        [altimeter startRelativeAltitudeUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAltitudeData * _Nullable altitudeData, NSError * _Nullable error) {
            NSLog(@"Pressure: %@", altitudeData.pressure);

        }];
        
    }
}



@end

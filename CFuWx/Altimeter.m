//
//  Altimeter.m
//  CFuWx
//
//  Created by Erica Winberry on 12/19/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "Altimeter.h"

@interface Altimeter ()

@property(strong, nonatomic) CMAltimeter *altimeter;

@end

@implementation Altimeter



-(void)getAltitudeChange{
    if([CMAltimeter isRelativeAltitudeAvailable]) {
        //        NSOperationQueue *altitudeQueue = [[NSOperationQueue alloc]init];
        
        self.altimeter = [[CMAltimeter alloc]init];
        [self.altimeter startRelativeAltitudeUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAltitudeData * _Nullable altitudeData, NSError * _Nullable error) {
        }];
        
    } else {
        NSLog(@"Error");
    }
}



@end

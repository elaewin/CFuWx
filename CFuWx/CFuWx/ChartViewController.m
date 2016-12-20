//
//  ChartViewController.m
//  CFuWx
//
//  Created by Erica Winberry on 12/19/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "ChartViewController.h"
#import "CFuWx-Swift.h"

@import Charts;
@import CoreMotion;

@interface ChartViewController ()

@property(nonatomic, strong) LineChartView *chartView;
@property(nonatomic, strong) CMAltimeter *altimeter;

@end

@implementation ChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Chart!";
    
    self.chartView = [[LineChartView alloc]init];
    
    self.chartView.frame = self.view.frame;
    
    [self.view addSubview:self.chartView];
    
}

-(void)getChartData {
    if([CMAltimeter isRelativeAltitudeAvailable]) {
        //        NSOperationQueue *altitudeQueue = [[NSOperationQueue alloc]init];
        
        self.chartView.data = [[ChartData alloc]init];
        
        self.altimeter = [[CMAltimeter alloc]init];
        [self.altimeter startRelativeAltitudeUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAltitudeData * _Nullable altitudeData, NSError * _Nullable error) {
            NSLog(@"Pressure: %.4f", altitudeData.pressure.floatValue);
        }];
        
    } else {
        NSLog(@"Error");
    }
}

@end

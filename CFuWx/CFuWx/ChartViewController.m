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
@property(nonatomic, strong) NSMutableArray *values;
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

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self getChartData];
    
}

-(void)getChartData {
    if([CMAltimeter isRelativeAltitudeAvailable]) {
        NSOperationQueue *altimeterQueue = [[NSOperationQueue alloc]init];
        
        self.chartView.data = [[ChartData alloc]init];
        
        self.values = [[NSMutableArray alloc]init];
        
        __weak typeof(self) bruce = self;
        self.altimeter = [[CMAltimeter alloc]init];
        [self.altimeter startRelativeAltitudeUpdatesToQueue:altimeterQueue withHandler:^(CMAltitudeData * _Nullable altitudeData, NSError * _Nullable error) {
            __strong typeof(bruce) hulk = bruce;
            NSNumber *pressure = altitudeData.pressure;
            [hulk.values addObject:pressure];
            [hulk refreshChart:hulk.values];
        }];
        
    } else {
        NSLog(@"Error");
    }
}

-(void)refreshChart:(NSMutableArray *)chartData {

}

@end

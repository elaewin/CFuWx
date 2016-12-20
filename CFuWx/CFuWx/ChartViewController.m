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
#import "Altimeter.h"

@interface ChartViewController () <ChartViewDelegate>

@property(nonatomic, strong) LineChartView *chartView;
@property(nonatomic, strong) Altimeter *altimeter;

@end

@implementation ChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Chart!";
    
    self.chartView = [[LineChartView alloc]init];
    
    self.chartView.frame = self.view.frame;
    
    [self.view addSubview:self.chartView];
    
    self.chartView.delegate = self;

}

-(void)getChartData {
    
}

@end

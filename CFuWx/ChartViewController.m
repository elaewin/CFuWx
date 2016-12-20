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

@property(strong, nonatomic) LineChartView *chartView;
@property(strong, nonatomic) NSMutableArray *values;
@property(strong, nonatomic) CMAltimeter *altimeter;
@property(nonatomic) double chartUpperLimit;
@property(nonatomic) double chartLowerLimit;

@end

@implementation ChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Chart!";
    self.chartUpperLimit = 0;
    self.chartLowerLimit = 0;
    
    self.chartView = [[LineChartView alloc]init];
    
    self.chartView.frame = self.view.frame;
    
    [self.view addSubview:self.chartView];
    
    [self setupChart];
    
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self getChartData];
    
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.altimeter stopRelativeAltitudeUpdates];
    [self.values removeAllObjects];
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
            // convert pressure from kPa to hPa!
            [hulk.values addObject:pressure];
            [hulk refreshChart:hulk.values];
        }];
        
    } else {
        NSLog(@"Error");
    }
}

-(void)setupChart {
    self.chartView.dragEnabled = NO;
    self.chartView.drawGridBackgroundEnabled = NO;
    self.chartView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.25];
    self.chartView.legend.enabled = NO;
    
    ChartXAxis *xAxis = self.chartView.xAxis;
    xAxis.drawAxisLineEnabled = NO;
    xAxis.drawGridLinesEnabled = NO;
    
    ChartYAxis *leftAxis = self.chartView.leftAxis;
    leftAxis.labelPosition = YAxisLabelPositionOutsideChart;
    leftAxis.labelFont = [UIFont fontWithName:@"Arial" size:9.0];
    leftAxis.labelTextColor = [UIColor magentaColor];
    leftAxis.drawAxisLineEnabled = YES;
    leftAxis.axisMaximum = self.chartUpperLimit;
    leftAxis.axisMinimum = self.chartLowerLimit;
    
}

-(void)getChartLimits:(double)newNumber {
    
    if (newNumber > self.chartUpperLimit - 5) {
        self.chartUpperLimit = newNumber + 5;
    }

    if (self.chartLowerLimit == 0) {
        self.chartLowerLimit = newNumber - 5;
    } else {
        if (newNumber < self.chartLowerLimit + 5) {
            self.chartLowerLimit = newNumber - 5;
        }
    }
}

-(void)refreshChart:(NSMutableArray *)chartData {
    LineChartDataSet *pressuresSet = [[LineChartDataSet alloc]initWithValues:self.values];
    if (self.chartView.data.dataSetCount > 0) {
        pressuresSet = (LineChartDataSet *)self.chartView.data.dataSets[0];
        pressuresSet.values = self.values;
        [self.chartView.data notifyDataChanged];
        [self.chartView notifyDataSetChanged];
    } else {
        pressuresSet.axisDependency = AxisDependencyRight;
        pressuresSet.valueTextColor = [UIColor redColor];
        pressuresSet.lineWidth = 2.0;
        pressuresSet.drawCirclesEnabled = NO;
        pressuresSet.drawValuesEnabled = NO;
        pressuresSet.fillAlpha = 1.0;
        pressuresSet.fillColor = [UIColor cyanColor];
        pressuresSet.drawCircleHoleEnabled = NO;
        
        NSMutableArray *dataSets = [[NSMutableArray alloc]init];
        [dataSets addObject:pressuresSet];
        
        LineChartData *data = [[LineChartData alloc] initWithDataSets:dataSets];
        [data setValueTextColor:[UIColor blackColor]];
        [data setValueFont:[UIFont fontWithName:@"Arial" size:9.0]];
        
        self.chartView.data = data;
    }
}

@end

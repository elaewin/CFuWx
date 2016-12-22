//
//  HourlyTableViewCell.h
//  CFuWx
//
//  Created by Jacob Dobson on 12/21/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForecastViewController.h"

@interface HourlyTableViewCell : UITableViewCell

//outlets
@property (weak, nonatomic) IBOutlet UILabel *hourlyTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *hourlyTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *hourlyWindLabel;
@property (weak, nonatomic) IBOutlet UILabel *hourlyPrecipLabel;
@property (weak, nonatomic) IBOutlet UIImageView *hourlyWxLabel;


@end

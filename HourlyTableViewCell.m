//
//  HourlyTableViewCell.m
//  CFuWx
//
//  Created by Jacob Dobson on 12/21/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "HourlyTableViewCell.h"

@interface HourlyTableViewCell()

@property(strong, nonatomic) ForecastViewController *forecastViewController;

@end

@implementation HourlyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  DailyTableViewCell.h
//  CFuWx
//
//  Created by Jacob Dobson on 12/21/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForecastViewController.h"

@interface DailyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dailyDayLabel;
@property (weak, nonatomic) IBOutlet UILabel *dailyHighLabel;
@property (weak, nonatomic) IBOutlet UILabel *dailyLowLabel;
@property (weak, nonatomic) IBOutlet UILabel *dailyWindLabel;
@property (weak, nonatomic) IBOutlet UILabel *dailyPrecipLabel;
@property (weak, nonatomic) IBOutlet UIImageView *dailyWxLabel;

@end

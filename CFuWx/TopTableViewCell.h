//
//  TopTableViewCell.h
//  CFuWx
//
//  Created by Corey Malek on 12/20/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"

@interface TopTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *time;

@property (weak, nonatomic) IBOutlet UILabel *date;

@property (weak, nonatomic) IBOutlet UILabel *location;

@property (weak, nonatomic) IBOutlet UILabel *temperature;

@property (weak, nonatomic) IBOutlet UIImageView *weatherIconImage;

@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;

@end

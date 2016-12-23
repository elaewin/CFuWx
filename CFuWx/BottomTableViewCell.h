//
//  BottomTableViewCell.h
//  CFuWx
//
//  Created by Corey Malek on 12/20/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BottomTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *pressure;

@property (weak, nonatomic) IBOutlet UILabel *relativeHumidity;
@property (weak, nonatomic) IBOutlet UILabel *windDirection;

@property (weak, nonatomic) IBOutlet UILabel *windSpeed;
@property (weak, nonatomic) IBOutlet UILabel *apparentTemperature;

@end

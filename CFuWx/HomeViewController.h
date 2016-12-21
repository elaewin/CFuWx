//
//  HomeViewController.h
//  CFuWx
//
//  Created by Erica Winberry on 12/18/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopTableViewCell.h"
#import "BottomTableViewCell.h"

@import CoreLocation;

@interface HomeViewController : UIViewController

@property(strong, nonatomic) NSString *currentCity;
@property(strong, nonatomic) UITableView *tableView;


@end

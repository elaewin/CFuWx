//
//  TopTableViewCell.m
//  CFuWx
//
//  Created by Corey Malek on 12/20/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "TopTableViewCell.h"
@interface TopTableViewCell()

@property(strong, nonatomic) HomeViewController *homeViewController;


@end

@implementation TopTableViewCell






- (void)awakeFromNib {
    [super awakeFromNib];
    _location.text = _homeViewController.currentCity;
    
    NSLog(@"%@", _homeViewController.currentCity);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

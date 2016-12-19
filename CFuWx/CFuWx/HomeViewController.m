//
//  HomeViewController.m
//  CFuWx
//
//  Created by Erica Winberry on 12/18/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "HomeViewController.h"
#import "Altimiter.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Altimiter *altimeter = [[Altimiter alloc]init];
    [altimeter getAltitudeChange];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    

}



@end

//
//  ForecastViewController.m
//  CFuWx
//
//  Created by Erica Winberry on 12/18/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "ForecastViewController.h"

@interface ForecastViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *forecastTableView;

@end

@implementation ForecastViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


//MARK: TableViewDelegate Methods

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
}


@end


/*
 code for background images from storm collection via unsplash
 
 -(UIImage *)getBackgroundImage {
 //setting background to image grabbed from "Storms" collection in unsplash.com
 NSURL *imageURL = [NSURL URLWithString:@"https://source.unsplash.com/collection/274155"];
 
 dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
 NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
 
 dispatch_async(dispatch_get_main_queue(), ^{
 // Update the UI
 self.backgroundImageView.image = [UIImage imageWithData:imageData];
 });
 });
 return self.backgroundImageView.image;
 }
 
 
 
 
 */




/*
 code for segue to this view controller(when forecast button in hamburger menu is pressed)
 
 
 ForecastViewController *forecastViewController = [[ForecastViewController alloc]init];
 [self presentViewController:forecastViewController animated:YES, completion:nil];
 
 
 */

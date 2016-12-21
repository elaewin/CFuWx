//
//  HomeViewController.m
//  CFuWx
//
//  Created by Erica Winberry on 12/18/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "HomeViewController.h"
#import "LocationManager.h"
#import "Altimeter.h"
#import "DarkSkyAPI.h"
#import "AppDelegate.h"

@import CoreLocation;

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>


@property(strong, nonatomic) TopTableViewCell *topTableViewCell;
@property(strong, nonatomic) BottomTableViewCell *bottomTableViewCell;


@property(strong, nonatomic)Altimeter *altimeter;
@property(strong, nonatomic) LocationManager *locationManager;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [DarkSkyAPI createDarkSkyAuthURL:[DarkSkyAPI currentlyQuery]];
    
    self.altimeter = [[Altimeter alloc]init];
//    [self.altimeter getAltitudeChange];
    
    // Core Location request permission for user's current location
    [[LocationManager sharedManager] requestPermissions];
    [[LocationManager sharedManager] requestLocation];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
}

//Delegate Methods:

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopTableViewCell"];
        return cell;
    }
    
    if(indexPath == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BottomTableViewCell"];
        return cell;
    }
    return [[UITableViewCell alloc]init];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}


@end

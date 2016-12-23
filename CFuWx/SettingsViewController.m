//
//  SettingsViewController.m
//  CFuWx
//
//  Created by Erica Winberry on 12/18/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "SettingsViewController.h"
#import "HomeViewController.h"
#import "AppDelegate.h"
#import "Location+CoreDataClass.h"
#import "LocationManager.h"
#import "DarkSkyAPI.h"


@interface SettingsViewController ()<UISearchBarDelegate>

@property(strong, nonatomic) NSMutableArray* searchedLocation;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar.delegate = self;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"%@", self.tabBarController.viewControllers.firstObject);
    __weak typeof(self) bruce = self;
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    
    [geocoder geocodeAddressString:searchBar.text completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        __strong typeof(bruce) hulk = bruce;
        if(placemarks.count > 0) {
            CLLocation *location = placemarks.lastObject.location;
            CLLocation *newLocation = location;
            NSLog(@"newLocation %@",newLocation);
            [[LocationManager sharedManager] setCurrentLocation:newLocation];
            NSArray *viewControllers = [hulk.tabBarController viewControllers];
            
            NSLog(@"The location is %@",location);
            [DarkSkyAPI fetchCurrentWeatherWithCompletion:^(Weather *weather) {
                __strong typeof(bruce) hulk = bruce;
                NSLog(@"the weather is %@",weather);
                
                HomeViewController *homeView = (HomeViewController *)viewControllers[0];
                homeView.currentWeather = weather;
                [[NSNotificationCenter defaultCenter]
                 postNotificationName:@"WeBeFinished"
                 object:hulk];
                NSLog(@"The weather is %@",weather.temperature);
                [hulk.tabBarController setSelectedIndex:0];
            }];
            
        }
        
    }];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
//    [self.view endEditing:YES];
}



@end

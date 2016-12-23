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
    
    [[LocationManager sharedManager] getLocationFrom:searchBar.text];
    [DarkSkyAPI fetchCurrentWeatherWithCompletion:^(Weather *weather) {
        __strong typeof(bruce) hulk = bruce;
        NSArray *viewControllers = [hulk.tabBarController viewControllers];
        HomeViewController *homeView = (HomeViewController *)viewControllers[0];
        homeView.currentWeather = weather;
        [self.tabBarController setSelectedIndex:0];
    
    }];
    
    
//    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
//    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
//    
//    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Location"];
//    request.predicate = [NSPredicate predicateWithFormat:@"Location.locationName == %@", _searchBar.text];
//    
//    NSError *error;
//    NSArray *results = [context executeFetchRequest:request error:&error];
//    
//    if(!error){
//        NSLog(@"RESULTS: %@", results);
//    }

}


-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
//    [self.view endEditing:YES];
}
































@end

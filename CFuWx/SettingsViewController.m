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


@interface SettingsViewController ()<UISearchBarDelegate>

@property(strong, nonatomic) NSMutableArray* searchedLocation;


@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


-(void)searchButtonClicked:(UISearchBar *)searchBar {
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = appDelegate.persistentContainer.viewContext;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Location"];
    request.predicate = [NSPredicate predicateWithFormat:@"Location.locationName == %@", searchBar.text];
    
    NSError *error;
    NSArray *results = [context executeFetchRequest:request error:&error];
    
    if(!error){
        NSLog(@"RESULTS: %@", results);
    }

    
}
































@end

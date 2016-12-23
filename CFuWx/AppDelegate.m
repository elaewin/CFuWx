//
//  AppDelegate.m
//  CFuWx
//
//  Created by Erica Winberry on 12/18/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//
@import Parse;

#import "AppDelegate.h"
#import "Credentials.h"
#import "DarkSkyAPI.h"
#import "Weather.h"
#import "HomeViewController.h"
#import "SettingsViewController.h"
#import "ForecastViewController.h"
#import "LocationManager.h"
#import "Location+CoreDataClass.h"

@interface AppDelegate ()

@property(strong, nonatomic) UITabBarController *homeViewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [Parse initializeWithConfiguration:[ParseClientConfiguration configurationWithBlock:^(id<ParseMutableClientConfiguration>  _Nonnull configuration) {
        configuration.applicationId = kApplicationID;
        configuration.clientKey =  kMasterKey;
        configuration.server =  kServerURL;
    }]];

    [self setUpTabBarControllerAsRoot];
    [self bootstrapApp];
    return YES;
}

-(void)bootstrapApp{
    self.homeViewController = (UITabBarController *)self.window.rootViewController;
    
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Location"];
    
    NSError *error;
    NSInteger count = [self.persistentContainer.viewContext countForFetchRequest:request error:&error];
    NSLog(@"NUMBER OF LOCATION ITEMS IN CORE DATA: %ld", (long)count);
    
    if(error){
        NSLog(@"Error Fetching Locations From Core Data");
    }
    
    if(count == 0) {
        
        NSLog(@"COUNT = ZERO!!");
        
        Location *startLocation = [NSEntityDescription insertNewObjectForEntityForName:@"Location" inManagedObjectContext:self.persistentContainer.viewContext];
        
        startLocation.locationName = @"Seattle";
        startLocation.latitude = 47.618335;
        startLocation.longitude = -122.352264;
        
        NSError *saveError;
        BOOL isSaved = [self.persistentContainer.viewContext save:&saveError];
        
        if(isSaved){
            NSLog(@"Saved Successfully To Core Data");
        } else {
            NSLog(@"Save Unsuccessful - Save Error: %@", saveError.localizedDescription);
        }
        
        CLLocation *startingLocation = [[CLLocation alloc]initWithLatitude:47.618335 longitude:-122.352264];
        [[LocationManager sharedManager] setCurrentLocation:startingLocation];
        
        __weak typeof(self) bruce = self;
        [DarkSkyAPI fetchCurrentWeatherWithCompletion:^(Weather *weather) {
            __strong typeof(bruce) hulk = bruce;
            
            HomeViewController *homeController = hulk.homeViewController.viewControllers.firstObject;
            homeController.currentWeather = weather;
            
        }];
    } else {
        
        NSLog(@"CORE DATA EXISTS!");
        NSLog(@"%@", request);
        
        NSError *fetchError;
        NSArray *results = [self.persistentContainer.viewContext executeFetchRequest:request error:&fetchError];
        
        Location *storedLocation = results.firstObject;
        
        CLLocation *startingLocation = [[CLLocation alloc]initWithLatitude:storedLocation.latitude longitude:storedLocation.longitude];
        [[LocationManager sharedManager] setCurrentLocation:startingLocation];
        
        __weak typeof(self) bruce = self;
        
        [DarkSkyAPI fetchCurrentWeatherWithCompletion:^(Weather *weather) {
            __strong typeof(bruce) hulk = bruce;
            
            HomeViewController *homeController = hulk.homeViewController.viewControllers.firstObject;
            homeController.currentWeather = weather;
        }];
    }
}


-(void)setUpTabBarControllerAsRoot {
    
    self.window = [[UIWindow alloc]init];
    
    UITabBarController *rootController = [[UITabBarController alloc]init];
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIStoryboard *settingsStoryBoard = [UIStoryboard storyboardWithName:@"Settings" bundle:nil];
    UIStoryboard *forecastStoryBoard = [UIStoryboard storyboardWithName:@"Forecast" bundle:nil];
    
    UIViewController *homeViewController = [mainStoryBoard instantiateInitialViewController];
    UIViewController *settingsViewController = [settingsStoryBoard instantiateInitialViewController];
    UIViewController *forecastViewController = [forecastStoryBoard instantiateInitialViewController];
    
    rootController.viewControllers = @[homeViewController, forecastViewController, settingsViewController];
    
    UIImage *homeTabImage = [UIImage imageNamed:@"home-page"];
    [[rootController.tabBar.items objectAtIndex:0] setImage:homeTabImage];
    
    UIImage *textMenuImage = [UIImage imageNamed:@"menu"];
    [[rootController.tabBar.items objectAtIndex:1] setImage:textMenuImage];
    [[rootController.tabBar.items objectAtIndex:1] setTitle:@"Text Forecasts"];
    
    UIImage *settingsGearImage = [UIImage imageNamed:@"settings-work-tool"];
    [[rootController.tabBar.items objectAtIndex:2] setImage:settingsGearImage];
    [[rootController.tabBar.items objectAtIndex:2] setTitle:@"Settings"];
    
    rootController.tabBar.backgroundColor = [UIColor clearColor];
    rootController.tabBar.tintColor = [UIColor whiteColor];
    
    self.window.rootViewController = rootController;
    [self.window makeKeyAndVisible];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"CFuWx"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end

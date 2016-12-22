//
//  MenuStackViewController.m
//  CFuWx
//
//  Created by Jacob Dobson on 12/22/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "MenuStackViewController.h"

CGFloat kStackVCWidthMultiplier = 0.3;

@interface MenuStackViewController ()

@property(strong, nonatomic) NSArray *viewControllers;
@property(strong, nonatomic) UIViewController *topViewController;
@property(strong, nonatomic) UIViewController *stackViewController;

@end

@implementation MenuStackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupViewControllers];
    
    self.topViewController = self.viewControllers.firstObject;
    
    [self setupStackMenu];
    
}

-(void)setupViewControllers {
    
    UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIStoryboard *forecastSB = [UIStoryboard storyboardWithName:@"Forecast" bundle:nil];
    UIStoryboard *settingsSB = [UIStoryboard storyboardWithName:@"Settings" bundle:nil];
    
    UIViewController *mainVC = [mainSB instantiateViewControllerWithIdentifier:@"HomeViewController"];
    UIViewController *forecastVC = [forecastSB instantiateViewControllerWithIdentifier:@"ForecastViewController"];
    UIViewController *settingsVC = [settingsSB instantiateViewControllerWithIdentifier:@"SettingsViewController"];
    
    self.viewControllers = @[mainVC, forecastVC, settingsVC];
    [self setupChildController:mainVC];
}

-(void)setupChildController:(UIViewController *)childVC {
    [self addChildViewController:childVC];
    
    childVC.view.frame = self.view.frame;
    
    [self.view addSubview:childVC.view];
    
    [childVC didMoveToParentViewController:self];
}

-(void)setupStackMenu {
    UIViewController *stackVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuStack"];
    
    CGFloat stackWidth = self.view.frame.size.width / kStackVCWidthMultiplier;
    
    CGFloat leftMargin = self.view.frame.size.width - stackWidth;
    
    self.stackViewController = stackVC;
    
    [self addChildViewController:stackVC];
    
    CGRect frame = CGRectMake(leftMargin, 0.0, stackWidth, self.view.frame.size.height);
    
    stackVC.view.frame = self.view.frame;
    
    [self.view addSubview:stackVC.view];
    
    [stackVC didMoveToParentViewController:self];
    
}

@end





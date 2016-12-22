//
//  BurgerMenuViewController.m
//  CFuWx
//
//  Created by Jacob Dobson on 12/22/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "BurgerMenuViewController.h"

NSTimeInterval kMenuShowHideItemsDuration = 0.3;

@interface BurgerMenuViewController ()

@property(strong, nonatomic)IBOutletCollection(UIView) NSArray *stackViews;

@end

@implementation BurgerMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    UIStackView *menuStack = [[UIStackView alloc]initWithArrangedSubviews:_stackViews];
    
    //    for (UIView *stackItem in _stackViews) {
    //        NSLog(@"Menu Item Present.");
    //        [stackItem setHidden:NO];
    //    }
    
    // Do any additional setup after loading the view.
}

-(void)toggleMenuItems {
    
    __weak typeof(self) bruce = self;
    [UIStackView animateWithDuration:kMenuShowHideItemsDuration animations:^{
        __strong typeof(bruce) hulk = bruce;
        
        //        for (UIView *stackItem in hulk.stackViews) {
        //            stackItem.hidden = !stackItem.hidden;
        //        }
        
        for (UIView *stackItem in hulk.stackViews) {
            if (stackItem.hidden) {
                [stackItem setHidden:NO];
            } else {
                [stackItem setHidden:YES];
            }
        }
        
    } completion:^(BOOL finished) {
        __strong typeof(bruce) hulk = bruce;
        // do something here...
    }];
}

- (IBAction)burgerButtonPressed:(UIButton *)sender {
    NSLog(@"Burger pressed");
    for (UIView *stackItem in self.stackViews) {
        if (stackItem.hidden) {
            [stackItem setHidden:NO];
        } else {
            [stackItem setHidden:YES];
        }
    }
    // show all of the other buttons here.
}

@end

//
//  NSString+Validation.m
//  CFuWx
//
//  Created by Corey Malek on 12/22/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "NSString+Validation.h"
#import "SettingsViewController.h"

@implementation NSString (Validation)


-(BOOL)isValid {
    
    NSString *regexPattern = @"[^0-9]";
    
    NSError *regexError;
    
    NSRegularExpression *regex = [[NSRegularExpression alloc]initWithPattern:regexPattern options:NSRegularExpressionCaseInsensitive error:&regexError];
    
    NSRange range = NSMakeRange(5,5);
    
    NSUInteger matches = [regex numberOfMatchesInString:self options:NSMatchingReportCompletion range:range];
    
    if (matches > 0) {
        return false;
    }
    return true;
    
}




@end

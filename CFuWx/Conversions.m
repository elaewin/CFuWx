//
//  Conversions.m
//  CFuWx
//
//  Created by Erica Winberry on 12/20/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "Conversions.h"

@implementation Conversions


+(NSString *)formattedNumber:(double)numberToFormat {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    formatter = [[NSNumberFormatter alloc]init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.allowsFloats = YES;
    formatter.usesSignificantDigits = NO;
    formatter.minimumFractionDigits = 2;
    formatter.maximumFractionDigits = 2;
    formatter.groupingSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator];
    NSNumber *number = [NSNumber numberWithDouble:numberToFormat];
//    NSString *result = [NSString stringWithFormat:@"%@", number.decimalValue];
//    return result;
    return [formatter stringFromNumber:number];
}

// Pressure Conversions from kPa
+(NSString *)convertToInchesHg:(double)pressure {
    double inHg = (pressure * 0.295300);
    return [Conversions formattedNumber:inHg];
}

+(NSString *)convertToMillimetersHg:(double)pressure  {
    double mmHg = (pressure * 7.50062);
    return [Conversions formattedNumber:mmHg];
}

+(NSString *)convertToPSI:(double)pressure  {
    double psi = (pressure * 0.145038);
    return [Conversions formattedNumber:psi];
}

+(NSString *)convertToHectoPascal:(double)pressure {
    double hPa = (pressure * 10);
    return [Conversions formattedNumber:hPa];
}

// Height Conversions from Meters
+(NSString *)convertToFeet:(double)meters  {
    double feet = (meters * 3.2808);
    return [Conversions formattedNumber:feet];
}

+(NSString *)convertToMiles:(double)meters  {
    return @"meh";

}

+(NSString *)convertToKilometers:(double)meters  {
    return @"meh";

}


//// Depth of Precipitation Conversions from Inches
//+(double)convertToCentimeters:(double)depth  {
//
//}
//
//+(double)convertToMillimeters:(double)depth  {
//
//}
//
//
//// Wind Speed Unit Conversions from mph
//+(double)convertToKPH:(double)speed  {
//
//}
//
//+(double)convertToMetersPerSecond:(double)speed  {
//
//}
//
//+(double)convertToKnots:(double)speed  {
//
//}
//
//
//// Convert Dates
//+(NSString *)convertToDayOnly:(NSDate *)date  {
//
//}
//
//+(NSString *)convertToReadableDate:(NSDate *)date  {
//
//}
//
//
//// Convert Time
//+(NSString *)convertToReadableTime:(NSDate *)date  {
//
//}


@end

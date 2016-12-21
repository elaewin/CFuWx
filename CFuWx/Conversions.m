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

// Temperature Conversions from degrees Fahrenheit
+(NSString *) convertToCelsius:(double)tempFahrenheit {
    return @"meh";
}

+(NSString *) convertToKelvin:(double)tempFahrenheit {
    return @"meh";
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
    double miles = (meters / 1609.344);
    return [Conversions formattedNumber:miles];
}

+(NSString *)convertToKilometers:(double)meters  {
    double kilometers = (meters / 1000);
    return [Conversions formattedNumber:kilometers];
}


// Depth of Precipitation Conversions from Inches
+(NSString *)convertToCentimeters:(double)inches {
    double centimeters = (inches * 2.54);
    return [Conversions formattedNumber:centimeters];
}

+(NSString *)convertToMillimeters:(double)inches {
    double millimeters = (inches * 25.4);
    return [Conversions formattedNumber:millimeters];
}

// Wind Speed Unit Conversions from mph
+(NSString *)convertToKPH:(double)miles {
    double kph = (miles * 1.609344);
    return [Conversions formattedNumber:kph];
}

+(NSString *)convertToMetersPerSecond:(double)miles {
    double mps = (miles * 0.44704);
    return [Conversions formattedNumber:mps];
}

+(NSString *)convertToKnots:(double)miles {
    double knots = (miles * 1.15078);
    return [Conversions formattedNumber:knots];
}

// Convert Dates
+(NSString *)convertToDayOnly:(NSDate *)date  {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [formatter setLocale:locale];
    [formatter setDateFormat:@"EEE"];
    return [formatter stringFromDate:date];
}

+(NSString *)convertToReadableDate:(NSDate *)date  {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [formatter setLocale:locale];
    [formatter setDateFormat:@"EEE, MMM dd"];
    return [formatter stringFromDate:date];
}

// Convert Time
+(NSString *)convertToReadableTime:(NSDate *)date  {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [formatter setLocale:locale];
    [formatter setDateFormat:@"HH:mm a"];
    return [formatter stringFromDate:date];
}


@end

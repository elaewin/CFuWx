//
//  Conversions.m
//  CFuWx
//
//  Created by Erica Winberry on 12/20/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import "Conversions.h"

@implementation Conversions

+(NSString *)formatToOneDecimal:(double)numberToFormat {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    formatter = [[NSNumberFormatter alloc]init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.allowsFloats = YES;
    formatter.usesSignificantDigits = NO;
    formatter.minimumFractionDigits = 1;
    formatter.maximumFractionDigits = 1;
    formatter.groupingSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator];
    NSNumber *number = [NSNumber numberWithDouble:numberToFormat];
    return [formatter stringFromNumber:number];
}

+(NSString *)formatToTwoDecimals:(double)numberToFormat {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    formatter = [[NSNumberFormatter alloc]init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.allowsFloats = YES;
    formatter.usesSignificantDigits = NO;
    formatter.minimumFractionDigits = 2;
    formatter.maximumFractionDigits = 2;
    formatter.groupingSeparator = [[NSLocale currentLocale] objectForKey:NSLocaleGroupingSeparator];
    NSNumber *number = [NSNumber numberWithDouble:numberToFormat];
    return [formatter stringFromNumber:number];
}

// Temperature Conversions from degrees Fahrenheit
+(NSString *) convertToCelsius:(double)tempFahrenheit {
//    double multiplier = (
    double tempCelsius = ((tempFahrenheit - 32) * 5) / 9;
    return [Conversions formatToOneDecimal:tempCelsius];
}

+(NSString *) convertToKelvin:(double)tempFahrenheit {
    double tempKelvin = (((tempFahrenheit - 32) * 5) / 9) + 273.15;
    return [Conversions formatToOneDecimal:tempKelvin];
}

// Pressure Conversions from kPa
+(NSString *)convertToInchesHg:(double)pressure {
    double inHg = (pressure * 0.295300);
    return [Conversions formatToTwoDecimals:inHg];
}

+(NSString *)convertToMillimetersHg:(double)pressure  {
    double mmHg = (pressure * 7.50062);
    return [Conversions formatToTwoDecimals:mmHg];
}

+(NSString *)convertToPSI:(double)pressure  {
    double psi = (pressure * 0.145038);
    return [Conversions formatToTwoDecimals:psi];
}

+(NSString *)convertToHectoPascal:(double)pressure {
    double hPa = (pressure * 10);
    return [Conversions formatToTwoDecimals:hPa];
}

// Height Conversions from Meters
+(NSString *)convertToFeet:(double)meters  {
    double feet = (meters * 3.2808);
    return [Conversions formatToTwoDecimals:feet];
}

+(NSString *)convertToMiles:(double)meters  {
    double miles = (meters / 1609.344);
    return [Conversions formatToTwoDecimals:miles];
}

+(NSString *)convertToKilometers:(double)meters  {
    double kilometers = (meters / 1000);
    return [Conversions formatToTwoDecimals:kilometers];
}

// Depth of Precipitation Conversions from Inches
+(NSString *)convertToCentimeters:(double)inches {
    double centimeters = (inches * 2.54);
    return [Conversions formatToTwoDecimals:centimeters];
}

+(NSString *)convertToMillimeters:(double)inches {
    double millimeters = (inches * 25.4);
    return [Conversions formatToTwoDecimals:millimeters];
}

// Wind Speed Unit Conversions from mph
+(NSString *)convertToKPH:(double)miles {
    double kph = (miles * 1.609344);
    return [Conversions formatToTwoDecimals:kph];
}

+(NSString *)convertToMetersPerSecond:(double)miles {
    double mps = (miles * 0.44704);
    return [Conversions formatToTwoDecimals:mps];
}

+(NSString *)convertToKnots:(double)miles {
    double knots = (miles * 1.15078);
    return [Conversions formatToTwoDecimals:knots];
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

+(NSString *)convertToHourOnly:(NSDate *)date {
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    [formatter setLocale:locale];
    [formatter setDateFormat:@"HH:00"];
    return [formatter stringFromDate:date];
}

// Convert degrees to bearing
+(NSString *)windDirectionFromDegrees:(double)degrees {
    NSArray *directions = @[@"N", @"NNE", @"NE", @"ENE", @"E", @"ESE", @"SE", @"SSE", @"S", @"SSW", @"SW", @"WSW", @"W", @"WNW", @"NW", @"NNW"];
    
    int i = (degrees + 11.25)/22.5;
    return directions[i % 16];
}

// Convert decimal number into percentage
+(NSString *)convertToPercentage:(double)decimal {
    double percentage = (decimal * 100);
    return [Conversions formatToOneDecimal:percentage];
}




@end

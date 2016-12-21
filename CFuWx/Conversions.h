//
//  Conversions.h
//  CFuWx
//
//  Created by Erica Winberry on 12/20/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Conversions : NSObject

// Temperature Conversions from degrees Fahrenheit
+(NSString *) convertToCelsius:(double)tempFahrenheit;
+(NSString *) convertToKelvin:(double)tempFahrenheit;

// Pressure Conversions from kPa
+(NSString *)convertToInchesHg:(double)pressure;
+(NSString *)convertToMillimetersHg:(double)pressure;
+(NSString *)convertToPSI:(double)pressure;
+(NSString *)convertToHectoPascal:(double)pressure;

// Height Conversions from Meters
+(NSString *)convertToFeet:(double)meters;
+(NSString *)convertToMiles:(double)meters;
+(NSString *)convertToKilometers:(double)meters;

//// Depth of Precipitation Conversions from Inches
+(NSString *)convertToCentimeters:(double)inches;
+(NSString *)convertToMillimeters:(double)inches;

//// Wind Speed Unit Conversions from mph
+(NSString *)convertToKPH:(double)miles;
+(NSString *)convertToMetersPerSecond:(double)miles;
+(NSString *)convertToKnots:(double)miles;

// Convert Dates
+(NSString *)convertToDayOnly:(NSDate *)date;
+(NSString *)convertToReadableDate:(NSDate *)date;

// Convert Time
+(NSString *)convertToReadableTime:(NSDate *)date;

@end

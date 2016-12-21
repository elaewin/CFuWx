//
//  Conversions.h
//  CFuWx
//
//  Created by Erica Winberry on 12/20/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Conversions : NSObject


// Pressure Conversions from kPa
+(NSString *)convertToInchesHg:(double)pressure;
+(NSString *)convertToMillimetersHg:(double)pressure;
+(NSString *)convertToPSI:(double)pressure;
+(NSString *)convertToHectoPascal:(double)pressure;


//// Height Conversions from Meters
//+(double)convertToFeet:(double)height;
//+(double)convertToMiles:(double)height;
//+(double)convertToKilometer:(double)height;
//
//// Depth of Precipitation Conversions from Inches
//+(double)convertToCentimeters:(double)depth;
//+(double)convertToMillimeters:(double)depth;
//
//// Wind Speed Unit Conversions from mph
//+(double)convertToKPH:(double)speed;
//+(double)convertToMetersPerSecond:(double)speed;
//+(double)convertToKnots:(double)speed;
//
//// Convert Dates
//+(NSString *)convertToDayOnly:(NSDate *)date;
//+(NSString *)convertToReadableDate:(NSDate *)date;
//
//// Convert Time
//+(NSString *)convertToReadableTime:(NSDate *)date;
@end

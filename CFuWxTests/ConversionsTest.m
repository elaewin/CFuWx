//
//  ConversionsTest.m
//  CFuWx
//
//  Created by Erica Winberry on 12/20/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Conversions.h"

@interface ConversionsTest : XCTestCase

@property(strong, nonatomic) NSDate *date;

@end

@implementation ConversionsTest

- (void)setUp {
    [super setUp];
    
    NSCalendar *calendar = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setYear:2016];
    [components setMonth:12];
    [components setDay:21];
    [components setHour:00];
    [components setMinute:31];
    [components setSecond:45];
    
    self.date = [calendar dateFromComponents:components];
}

- (void)tearDown {
    self.date = nil;
    
    [super tearDown];
}

-(void)testFormatToOneDecimal {
    XCTAssert([[Conversions formatToOneDecimal:3.1415926] isKindOfClass:[NSString class]], @"formatToOneDecimal does NOT return an NSString");
    XCTAssert([[Conversions formatToOneDecimal:3.1415926] isEqualToString:@"3.1"], @"Value returned from conversion is %@, NOT 3.1!", [Conversions formatToOneDecimal:3.1415926]);
}

-(void)testFormatToTwoDecimals{
    XCTAssert([[Conversions formatToTwoDecimals:3.1415926] isKindOfClass:[NSString class]], @"formatToTwoDecimals does NOT return an NSString");
    XCTAssert([[Conversions formatToTwoDecimals:3.1415926] isEqualToString:@"3.14"], @"Value returned from conversion is %@, NOT 3.14!", [Conversions formatToTwoDecimals:3.1415926]);
}

-(void)testConvertToCelsius {
    XCTAssert([[Conversions convertToCelsius:32.0] isEqualToString:@"0.0"], @"Value returned from conversion is %@, NOT 0.0!", [Conversions convertToCelsius:32.0]);
    XCTAssert([[Conversions convertToCelsius:100.0] isEqualToString:@"37.8"], @"Value returned from conversion is %@, NOT 37.8!", [Conversions convertToCelsius:100.0]);
    XCTAssert([[Conversions convertToCelsius:-10.0] isEqualToString:@"-23.3"], @"Value returned from conversion is %@, NOT -23.3!", [Conversions convertToCelsius:-10.0]);
}

-(void)testConvertToKelvin {
    XCTAssert([[Conversions convertToKelvin:32.0] isEqualToString:@"273.2"],
              @"Value returned from conversion is %@, NOT 273.2!", [Conversions convertToKelvin:32.0]);
    XCTAssert([[Conversions convertToKelvin:100.0] isEqualToString:@"310.9"], @"Value returned from conversion is %@, NOT 310.9!", [Conversions convertToKelvin:100.0]);
    XCTAssert([[Conversions convertToKelvin:-10.0] isEqualToString:@"249.8"], @"Value returned from conversion is %@, NOT 249.8!", [Conversions convertToKelvin:-10.0]);
}

-(void)testConvertToInchesHg {
//    NSString *result = [Conversions convertToInchesHg:1.0];
    XCTAssert([[Conversions convertToInchesHg:1.0] isEqualToString:@"0.30"], @"Value returned from conversion is %@, NOT 0.30!", [Conversions convertToInchesHg:1.0]);
    XCTAssert([[Conversions convertToInchesHg:1015.24] isEqualToString:@"299.80"], @"Value returned from conversion is %@, NOT 0.30!", [Conversions convertToInchesHg:1015.24]);
}

-(void)testConvertToMillimetersHg {
    XCTAssert([[Conversions convertToMillimetersHg:1.0] isEqualToString:@"7.50"], @"Value returned from conversion is %@, NOT 7.50!", [Conversions convertToMillimetersHg:1.0]);
    XCTAssert([[Conversions convertToMillimetersHg:1015.24] isEqualToString:@"7,614.93"], @"Value returned from conversion is %@, NOT 7,614.93!", [Conversions convertToMillimetersHg:1015.24]);
}

-(void)testConvertToPSI {
    XCTAssert([[Conversions convertToPSI:1.0] isEqualToString:@"0.15"], @"Value returned from conversion is %@, NOT 0.15!", [Conversions convertToPSI:1.0]);
    XCTAssert([[Conversions convertToPSI:1015.24] isEqualToString:@"147.25"], @"Value returned from conversion is %@, NOT 147.25!", [Conversions convertToPSI:1015.24]);
}

-(void)testConvertToHectoPascal {
    XCTAssert([[Conversions convertToHectoPascal:1.0] isEqualToString:@"10.00"], @"Value returned from conversion is %@, NOT 10.00!", [Conversions convertToHectoPascal:1.0]);
    XCTAssert([[Conversions convertToHectoPascal:1015.24] isEqualToString:@"10,152.40"], @"Value returned from conversion is %@, NOT 10,152.40!", [Conversions convertToHectoPascal:1015.24]);
}

-(void)testConvertToFeet {
    XCTAssert([[Conversions convertToFeet:1.0] isEqualToString:@"3.28"], @"Value returned from conversion is %@, NOT 3.28!", [Conversions convertToFeet:1.0]);
    XCTAssert([[Conversions convertToFeet:1015.24] isEqualToString:@"3,330.80"], @"Value returned from conversion is %@, NOT 3,330.80!", [Conversions convertToFeet:1015.24]);
}

-(void)testConvertToMiles {
    XCTAssert([[Conversions convertToMiles:1.0] isEqualToString:@"0.00"], @"Value returned from conversion is %@, NOT 0.00!", [Conversions convertToFeet:1.0]);
    XCTAssert([[Conversions convertToMiles:1015.24] isEqualToString:@"0.63"], @"Value returned from conversion is %@, NOT 0.63!", [Conversions convertToFeet:1015.24]);
}

-(void)testConvertToKilometers {
    XCTAssert([[Conversions convertToKilometers:1.0] isEqualToString:@"0.00"], @"Value returned from conversion is %@, NOT 0.00!", [Conversions convertToKilometers:1.0]);
    XCTAssert([[Conversions convertToKilometers:1015.24] isEqualToString:@"1.02"], @"Value returned from conversion is %@, NOT 1.02!", [Conversions convertToKilometers:1015.24]);
}

-(void)testConvertToCentimeters {
    XCTAssert([[Conversions convertToCentimeters:1.0] isEqualToString:@"2.54"], @"Value returned from conversion is %@, NOT 2.54!", [Conversions convertToCentimeters:1.0]);
    XCTAssert([[Conversions convertToCentimeters:1015.24] isEqualToString:@"2,578.71"], @"Value returned from conversion is %@, NOT 2,578.71!", [Conversions convertToCentimeters:1015.24]);
}

-(void)testConvertToMillimeters {
    XCTAssert([[Conversions convertToMillimeters:1.0] isEqualToString:@"25.40"], @"Value returned from conversion is %@, NOT 25.40!", [Conversions convertToMillimeters:1.0]);
    XCTAssert([[Conversions convertToMillimeters:1015.24] isEqualToString:@"25,787.10"], @"Value returned from conversion is %@, NOT 25,787.10!", [Conversions convertToMillimeters:1015.24]);
}

-(void)testConvertToKPH {
    XCTAssert([[Conversions convertToKPH:1.0] isEqualToString:@"1.61"], @"Value returned from conversion is %@, NOT 1.61!", [Conversions convertToKPH:1.0]);
    XCTAssert([[Conversions convertToKPH:1015.24] isEqualToString:@"1,633.87"], @"Value returned from conversion is %@, NOT 1,633.87!", [Conversions convertToKPH:1015.24]);
}

-(void)testConvertToMetersPerSecond {
    XCTAssert([[Conversions convertToMetersPerSecond:1.0] isEqualToString:@"0.45"], @"Value returned from conversion is %@, NOT 0.45!", [Conversions convertToMetersPerSecond:1.0]);
    XCTAssert([[Conversions convertToMetersPerSecond:1015.24] isEqualToString:@"453.85"], @"Value returned from conversion is %@, NOT 453.85!", [Conversions convertToMetersPerSecond:1015.24]);
}

-(void)testConvertToKnots {
    XCTAssert([[Conversions convertToKnots:1.0] isEqualToString:@"1.15"], @"Value returned from conversion is %@, NOT 1.15!", [Conversions convertToKnots:1.0]);
    XCTAssert([[Conversions convertToKnots:1015.24] isEqualToString:@"1,168.32"], @"Value returned from conversion is %@, NOT 1,168.32!", [Conversions convertToKnots:1015.24]);
}

-(void)testConvertToDayOnly {
    XCTAssert([[Conversions convertToDayOnly:self.date] isEqualToString:@"Wed"], @"Value returned from conversion is %@, NOT Wed", [Conversions convertToDayOnly:self.date]);
}

-(void)testConvertToReadableDate {
    XCTAssert([[Conversions convertToReadableDate:self.date] isEqualToString:@"Wed, Dec 21"], @"Value returned from conversion is %@, NOT Wed, Dec 21", [Conversions convertToReadableDate:self.date]);
}

// Convert Time
-(void)testConvertToReadableTime {
    XCTAssert([[Conversions convertToReadableTime:self.date] isEqualToString:@"00:31 AM"], @"Value returned from conversion is %@, NOT 00:31 AM", [Conversions convertToReadableTime:self.date]);
}


@end






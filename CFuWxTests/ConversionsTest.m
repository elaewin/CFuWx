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

@end

@implementation ConversionsTest

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
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
    XCTAssert([[Conversions convertToHectoPascal:1.0] isEqualToString:@"0.15"], @"Value returned from conversion is %@, NOT 0.15!", [Conversions convertToPSI:1.0]);
}













@end

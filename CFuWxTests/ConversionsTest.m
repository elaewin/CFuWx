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
    XCTAssertEqual([Conversions convertToInchesHg:1.0], 0.30);
}


@end

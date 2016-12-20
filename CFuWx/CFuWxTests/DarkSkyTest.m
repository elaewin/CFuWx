//
//  DarkSkyTest.m
//  CFuWx
//
//  Created by Corey Malek on 12/19/16.
//  Copyright © 2016 Erica Winberry. All rights reserved.
//

#import <XCTest/XCTest.h>


@interface DarkSkyTest : XCTestCase

@property(strong, nonatomic) DarkSkyTest *testDarkSky;


@end

@implementation DarkSkyTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
}


- (void)tearDown {
    
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}






-(void)testDarkSkyNotNil{
    XCTAssertNotNil(self.testDarkSky, @"self.testDarkSky is nil");
}















@end

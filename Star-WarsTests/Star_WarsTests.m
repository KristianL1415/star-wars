//
//  Star_WarsTests.m
//  Star-WarsTests
//
//  Created by Kristian Lien on 2/26/16.
//  Copyright © 2016 Myriad Mobile. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSDateFormatter+ISO8601.h"

@interface Star_WarsTests : XCTestCase

@end

@implementation Star_WarsTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testISO8601DateFormatter
{
    NSString *dateString = @"2014-12-10T14:23:31.880000Z";
    NSDate *date = [[NSDateFormatter iso8601] dateFromString:dateString];
    
    XCTAssert([date isKindOfClass:[NSDate class]], @"Wrong date format");
}

@end

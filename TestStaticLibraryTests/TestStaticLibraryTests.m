//
//  TestStaticLibraryTests.m
//  TestStaticLibraryTests
//
//  Created by Marek Moscichowski on 08/04/14.
//  Copyright (c) 2014 Marek Mościchowski. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <UIKit/UIKit.h>
#import "TestStaticLibrary.h"

@interface TestStaticLibraryTests : XCTestCase

@end

@implementation TestStaticLibraryTests

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

- (void)testTyphoon
{
    TestStaticLibrary *library = [TestStaticLibrary new];
    XCTAssertTrue([[library runTyphoon] isKindOfClass:[UIViewController class]]);
}

- (void)testAFNetworking
{
    TestStaticLibrary *library = [TestStaticLibrary new];
    [library runAFNetworking];
}


@end

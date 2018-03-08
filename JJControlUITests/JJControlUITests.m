//
//  JJControlUITests.m
//  JJControlUITests
//
//  Created by admin on 2018/3/8.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KIF/KIF.h"
@interface JJControlUITests : KIFTestCase

@end

@implementation JJControlUITests

- (void)beforeAll {
    ////
    [tester scrollViewWithAccessibilityIdentifier:@"List Value" byFractionOfSizeHorizontal:0.0 vertical:0-0.5];
    // 4
    
    UIScrollView *repsStepper = (UIScrollView*)[tester waitForViewWithAccessibilityLabel:@"List"];
    
    CGPoint stepperCenter = [repsStepper.window convertPoint:repsStepper.center
                                                    fromView:repsStepper.superview];
    
    CGPoint minusButton = stepperCenter;
    minusButton.x -= CGRectGetWidth(repsStepper.frame) / 4;
    
    CGPoint plusButton = stepperCenter;
    plusButton.x += CGRectGetWidth(repsStepper.frame) / 4;
    
    // 3
    for (int i = 0; i < 20; i++) {
        [tester tapScreenAtPoint:CGPointMake(102/2, 729/2)];
    }
    
    
    // 2
    [tester waitForTimeInterval:1];
    
    [tester waitForTimeInterval:1];
    [tester tapScreenAtPoint:plusButton];
    [tester waitForTimeInterval:1];
    [tester tapScreenAtPoint:plusButton];
    [tester waitForTimeInterval:1];
    
    [tester waitForTimeInterval:260];
    
    
    // [KIFUITestActor setDefaultTimeout:2160];
}
- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end

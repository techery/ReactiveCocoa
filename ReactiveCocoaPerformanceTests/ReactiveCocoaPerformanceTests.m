//
//  ReactiveCocoaPerformanceTests.m
//  ReactiveCocoaPerformanceTests
//
//  Created by Petro Korienev on 3/21/16.
//  Copyright © 2016 GitHub. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ReactiveCocoa.h"
#import "RACTokenizedStringSequence.h"

@interface Dummy_Model : NSObject;

- (void)dummy_selector;

@end

@implementation Dummy_Model

- (void)dummy_selector {
    
}

@end

@interface ReactiveCocoaPerformanceTests : XCTestCase

@end

@implementation ReactiveCocoaPerformanceTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    RACTokenizedStringSequence *sequence = [RACTokenizedStringSequence sequenceWithString:@"abcd\nabc\n"
                                                                             tokenization:NSStringEnumerationByLines];
    NSString *fold = [[sequence map:^id(id x) {
        NSLog(@"%@", x);
        return x;
    }] foldLeftWithStart:@""
     reduce:^NSString *(NSString *accumulator, NSString *value) {
         return [accumulator stringByAppendingFormat:@"%@\n", value];
     }];
    NSLog(@"%@", fold);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        Dummy_Model *model = [Dummy_Model new];
        __block NSUInteger counter = 0;
        [[model rac_signalForSelector:@selector(dummy_selector)] subscribeNext:^(id x) {
            counter++;
        }];
        for (int i = 0; i < 1000; i++) {
            [model dummy_selector];
        }
    }];
}

@end

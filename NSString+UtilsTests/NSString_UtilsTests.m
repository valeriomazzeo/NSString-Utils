//
//  NSString_UtilsTests.m
//  NSString+UtilsTests
//
//  Created by Valerio Mazzeo on 23/06/2014.
//  Copyright (c) 2014 Valerio Mazzeo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Utils.h"

@interface NSString_UtilsTests : XCTestCase

@end

@implementation NSString_UtilsTests

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

- (void)testFirstLetter
{
    NSString *myString = @"my string";
    
    XCTAssertEqualObjects([myString firstLetter], @"m");
}

- (void)testFirstLetterWithEmptyString
{
    NSString *myString = @"";
    
    XCTAssertEqualObjects([myString firstLetter], @"");
}

- (void)testStringByEnsuringHttpPrefixWithNoPrefix
{
    NSString *myString = @"valeriomazzeo.com";
    
    XCTAssertEqualObjects([myString stringByEnsuringHttpPrefix], @"http://valeriomazzeo.com");
}

- (void)testStringByEnsuringHttpPrefixWithHttpsPrefix
{
    NSString *myString = @"https://valeriomazzeo.com";
    
    XCTAssertEqualObjects([myString stringByEnsuringHttpPrefix], myString);
}

- (void)testStringByEnsuringHttpPrefixWithHttpPrefix
{
    NSString *myString = @"http://valeriomazzeo.com";
    
    XCTAssertEqualObjects([myString stringByEnsuringHttpPrefix], myString);
}

- (void)testStringByEnsuringPrefixWithNoPrefix
{
    NSString *myString = @"my string";
    NSString *prefix = @"_";
    
    XCTAssertEqualObjects([myString stringByEnsuringPrefix:prefix], @"_my string");
}

- (void)testStringByEnsuringPrefixWithPrefix
{
    NSString *myString = @"_my string";
    NSString *prefix = @"_";
    
    XCTAssertEqualObjects([myString stringByEnsuringPrefix:prefix], @"_my string");
}

- (void)testStringByEnsuringSuffixWithNoSuffix
{
    NSString *myString = @"my string";
    NSString *suffix = @"_";
    
    XCTAssertEqualObjects([myString stringByEnsuringSuffix:suffix], @"my string_");
}

- (void)testStringByEnsuringSuffixWithSuffix
{
    NSString *myString = @"my string_";
    NSString *suffix = @"_";
    
    XCTAssertEqualObjects([myString stringByEnsuringSuffix:suffix], @"my string_");
}

- (void)testStringByAppendingQueryParametersWithMultipleParameters
{
    NSString *myString = @"localhost/test";
    
    NSDictionary *parameters = @{@"param1": @"value1",
                                 @"param2": @"value2",
                                 @"param3": @"value 3 with spaces"};
    
    myString = [myString stringByAppendingQueryParameters:parameters];
    
    XCTAssertTrue([myString componentsSeparatedByString:@"&"].count == 3);
}

- (void)testStringByAppendingQueryParametersWithUnescapedValues
{
    NSString *myString = @"localhost/test";
    
    NSDictionary *parameters = @{@"param3": @"value 3 with spaces"};
    
    myString = [myString stringByAppendingQueryParameters:parameters];
    
    XCTAssertEqualObjects(myString, @"localhost/test?param3=value%203%20with%20spaces");
}

- (void)testStringByAppendingQueryParametersWithQuestionMarkSuffix
{
    NSString *myString = @"localhost/test?";
    
    NSDictionary *parameters = @{@"param1": @"value1"};
    
    myString = [myString stringByAppendingQueryParameters:parameters];
    
    XCTAssertEqualObjects(myString, @"localhost/test?param1=value1");
}

- (void)testStringByAppendingQueryParametersWithExistingParameters
{
    NSString *myString = @"localhost/test?param1=value1";
    
    NSDictionary *parameters = @{@"param2": @"value2"};
    
    myString = [myString stringByAppendingQueryParameters:parameters];
    
    XCTAssertEqualObjects(myString, @"localhost/test?param1=value1&param2=value2");
}

- (void)testStringByAppendingQueryParametersWithExistingParametersWithAmpersandSuffix
{
    NSString *myString = @"localhost/test?param1=value1&";
    
    NSDictionary *parameters = @{@"param2": @"value2"};
    
    myString = [myString stringByAppendingQueryParameters:parameters];
    
    XCTAssertEqualObjects(myString, @"localhost/test?param1=value1&param2=value2");
}

@end

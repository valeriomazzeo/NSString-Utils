//
//  NSString+Utils.m
//  SocialSDK
//
//  Created by Valerio Mazzeo on 17/06/2014.
//  Copyright (c) 2014 Valerio Mazzeo. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

- (NSString *)firstLetter
{    
    if (!self.length || self.length == 1) {
        return self;
    } else {
        return [self substringToIndex:1];
    }
}

- (NSString *)stringByEnsuringHttpPrefix
{
    if ([self hasPrefix:@"https://"]) {
        return self;
    } else {
        return [self stringByEnsuringPrefix:@"http://"];
    }
}

- (NSString *)stringByEnsuringPrefix:(NSString *)prefix
{
    if (prefix) {
        if ([self hasPrefix:prefix]) {
            return self;
        } else {
            return [prefix stringByAppendingString:self];
        }
    } else {
        return self;
    }
}

- (NSString *)stringByEnsuringSuffix:(NSString *)suffix
{
    if (suffix) {
        if ([self hasSuffix:suffix]) {
            return self;
        } else {
            return [self stringByAppendingString:suffix];
        }
    } else {
        return self;
    }
}

- (NSString *)stringByEnsuringNoPrefix:(NSString *)prefix
{
    if (prefix) {
        NSString *result = [self copy];
        while ([result hasPrefix:prefix]) {
            result = [result substringFromIndex:prefix.length];
        }
        return result;
    } else {
        return self;
    }
}

- (NSString *)stringByEnsuringNoSuffix:(NSString *)suffix
{
    if (suffix) {
        NSString *result = [self copy];
        while ([result hasSuffix:suffix]) {
            result = [result substringToIndex:result.length - suffix.length];
        }
        return result;
    } else {
        return self;
    }    
}

- (NSString *)stringByAppendingQueryParameters:(NSDictionary *)parameters
{
    return [self stringByAppendingQueryParameters:parameters ordered:NO];
}

- (NSString *)stringByAppendingQueryParameters:(NSDictionary *)parameters ordered:(BOOL)ordered
{
    NSMutableString *URLWithQuerystring = [[NSMutableString alloc] initWithString:self];
    
    NSArray *keys;
    
    if (ordered) {
        keys = [parameters.allKeys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    } else {
        keys = parameters.allKeys;
    }
    
    for (NSString *key in keys) {
        
        NSString *valueString = [parameters objectForKey:key];
        
        NSRange questionMarkRange = [URLWithQuerystring rangeOfString:@"?"];
        
        NSString *parameterPrefix = questionMarkRange.location == NSNotFound || [URLWithQuerystring hasSuffix:@"?"] ? @"?" : @"&";
        
        NSString *formatString = [@"%@=%@" stringByEnsuringPrefix:parameterPrefix];
        
        URLWithQuerystring = [[URLWithQuerystring stringByEnsuringNoSuffix:parameterPrefix] mutableCopy];
        
        [URLWithQuerystring appendFormat:formatString,
         [key stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],
         [valueString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    
    return URLWithQuerystring;
}

@end

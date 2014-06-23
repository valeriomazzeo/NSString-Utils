//
//  NSString+Utils.h
//  SocialSDK
//
//  Created by Valerio Mazzeo on 17/06/2014.
//  Copyright (c) 2014 Valerio Mazzeo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utils)

- (NSString *)firstLetter;

- (NSString *)stringByEnsuringHttpPrefix;

- (NSString *)stringByEnsuringPrefix:(NSString *)prefix;
- (NSString *)stringByEnsuringSuffix:(NSString *)suffix;

- (NSString *)stringByEnsuringNoPrefix:(NSString *)prefix;
- (NSString *)stringByEnsuringNoSuffix:(NSString *)suffix;

- (NSString*)stringByAppendingQueryParameters:(NSDictionary *)parameters;

@end

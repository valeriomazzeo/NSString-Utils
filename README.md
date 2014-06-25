# NSString+Utils
[![Build Status](http://img.shields.io/travis/valeriomazzeo/NSString-Utils.svg?style=flat)](https://travis-ci.org/valeriomazzeo/NSString+Utils)
 ![Pod Version](http://img.shields.io/cocoapods/v/NSString+Utils.svg?style=flat)
 ![Pod Platform](http://img.shields.io/cocoapods/p/NSString+Utils.svg?style=flat)
 [![Pod License](http://img.shields.io/cocoapods/l/NSString+Utils.svg?style=flat)](http://opensource.org/licenses/MIT)

## GETTING STARTED

NSString (Utils) extends the NSString class to provide additional functionalities.


## USAGE

The methods are probably self explanatory:

```
@interface NSString (Utils)

- (NSString *)firstLetter;

- (NSString *)stringByEnsuringHttpPrefix;

- (NSString *)stringByEnsuringPrefix:(NSString *)prefix;
- (NSString *)stringByEnsuringSuffix:(NSString *)suffix;

- (NSString *)stringByEnsuringNoPrefix:(NSString *)prefix;
- (NSString *)stringByEnsuringNoSuffix:(NSString *)suffix;

- (NSString*)stringByAppendingQueryParameters:(NSDictionary *)parameters;

@end
```

## LICENSE

NSString+Utils is available under the MIT License (MIT).

Copyright (c) 2014 Valerio Mazzeo

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

## AUTHOR

[Valerio Mazzeo](https://twitter.com/valeriomazzeo)
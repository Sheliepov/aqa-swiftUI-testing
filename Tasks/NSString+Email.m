//
//  NSString+Email.m
//  ReaddleLib
//
//  Created by Igor Fedorov on 6/4/12.
//  Copyright (c) 2012 Readdle. All rights reserved.
//

#import "NSString+Email.h"

@implementation NSString(Email)

+ (NSString *)filterStringFromFirstLastName:(NSString *)aTestString
{
    const NSRange bracesRange = [aTestString rangeOfString:@"<.+>" options:NSRegularExpressionSearch];
    if (NSNotFound == bracesRange.location) {
        return aTestString;
    }
    else {
        return [aTestString substringWithRange:NSMakeRange(bracesRange.location + 1, bracesRange.length - 2)];
    }
}

+ (BOOL)isStringMail:(NSString*)testString
{
    NSString *const filteredString = [self filterStringFromFirstLastName:testString];
    if (0 == filteredString.length) {
        return NO;
    }
    
    //NSLog(@"mail to test %@", filteredString);
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    // top level domains can be pretty long https://en.wikipedia.org/wiki/List_of_Internet_top-level_domains
    
    // https://en.wikipedia.org/wiki/Email_address#Domain
    // The domain name part of an email address has to conform to strict guidelines:
    // it must match the requirements for a hostname, a list of dot-separated DNS labels,
    // each label being limited to a length of 63 characters.
    NSString *const stricterFilterString = @"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,63}$";
    NSString *const laxString = @"^.+@.+\\.[A-Za-z]{2}[A-Za-z]*$";
    NSString *const emailRegex = stricterFilter ? stricterFilterString : laxString;
    return NSNotFound != [filteredString rangeOfString:emailRegex options:NSRegularExpressionSearch].location;
}

@end

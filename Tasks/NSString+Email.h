//
//  NSString+Email.h
//  ReaddleLib
//
//  Created by Igor Fedorov on 6/4/12.
//  Copyright (c) 2012 Readdle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(Email)
+ (BOOL)isStringMail:(NSString*)testString;
+ (NSString *)filterStringFromFirstLastName:(NSString *)aTestString;

@end

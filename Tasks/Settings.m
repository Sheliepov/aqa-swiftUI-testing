//
//  Settings.m
//  Tasks
//
//  Created by Evgeny on 13.09.2022.
//  Copyright © 2022 Cultured Code. All rights reserved.
//

#import "Settings.h"


@interface Settings ()

@property (nonatomic, readonly) NSDictionary<NSString *, NSNumber *> *arguments;

@end

@implementation Settings

+ (instancetype)sharedInstance {
    static Settings *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self new];
    });
    
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (nil != self) {
        
        NSDictionary *dictionary = NSBundle.mainBundle.infoDictionary[@"TasksArguments"];
        NSAssert([dictionary isKindOfClass:NSDictionary.class], @"%@", dictionary);
        _arguments = dictionary;
    }
    
    return self;
}

- (BOOL)argBoolForKey:(NSString *)key {
    NSNumber *const number = self.arguments[key];
    
    if (NO == [number isKindOfClass:NSNumber.class]) {
        NSAssert(NO, @"Number %@ is not found or incorrect for key %@", number, key);
        return NO;
    }
    
    const float floatValue = MIN(MAX(number.floatValue, 0), 1);
    const uint32_t uintValue = floatValue * UINT32_MAX;
    return uintValue > arc4random();
}

static NSString *const isLoginSucceededKey = @"isLoginSucceededKey";

- (void)setIsLoginSucceeded:(BOOL)isLoginSucceeded {
    [NSUserDefaults.standardUserDefaults setBool:isLoginSucceeded forKey:isLoginSucceededKey];
}

- (BOOL)isLoginSucceeded {
    return [NSUserDefaults.standardUserDefaults boolForKey:isLoginSucceededKey];
}

@end

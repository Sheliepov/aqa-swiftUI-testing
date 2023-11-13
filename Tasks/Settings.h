//
//  Settings.h
//  Tasks
//
//  Created by Evgeny on 13.09.2022.
//  Copyright © 2022 Cultured Code. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@interface Settings : NSObject

@property (nonatomic) BOOL isLoginSucceeded;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)sharedInstance;

- (BOOL)argBoolForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END

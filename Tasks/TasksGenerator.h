//
//  TasksGenerator.h
//  Tasks
//
//  Created by Evgeny on 13.09.2022.
//  Copyright © 2022 Cultured Code. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@class Task;

@interface TasksGenerator : NSObject

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

+ (NSArray<Task *> *)generateTasks;

@end

NS_ASSUME_NONNULL_END

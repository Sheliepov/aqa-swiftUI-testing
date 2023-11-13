//
//  Task.h
//  Tasks
//
//  Created by Evgeny on 13.09.2022.
//  Copyright © 2022 Cultured Code. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSObject

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSArray<Task *> *subtasks;
@property (nonatomic, readonly) BOOL isCompleted;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithTitle:(NSString *)title
                  isCompleted:(BOOL)isCompleted
                     subtasks:(nullable NSArray<Task *> *)subtasks NS_DESIGNATED_INITIALIZER;;

- (void)setIsCompleted:(BOOL)isCompleted
        updateSubtasks:(BOOL)updateSubtasks;

- (void)updateIsCompletedStateBasedOnSubtasksIfNeeded;

@end

NS_ASSUME_NONNULL_END

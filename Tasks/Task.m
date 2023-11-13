//
//  Task.m
//  Tasks
//
//  Created by Evgeny on 13.09.2022.
//  Copyright © 2022 Cultured Code. All rights reserved.
//

#import "Task.h"


@interface Task ()

@property (nonatomic, readwrite) BOOL isCompleted;

@end

@implementation Task

- (instancetype)initWithTitle:(NSString *)title
                  isCompleted:(BOOL)isCompleted
                     subtasks:(NSArray<Task *> *)subtasks
{
    NSParameterAssert(nil != title);
    
    self = [super init];
    
    if (nil != self) {
        _title = title;
        _isCompleted = isCompleted;
        _subtasks = subtasks ?: @[];
    }
    
    return self;
}

- (void)setIsCompleted:(BOOL)isCompleted
        updateSubtasks:(BOOL)updateSubtasks
{
    self.isCompleted = isCompleted;
    
    if (updateSubtasks) {
        for (Task *subtask in self.subtasks) {
            [subtask setIsCompleted:isCompleted
                     updateSubtasks:updateSubtasks];
        }
    }
}

- (void)updateIsCompletedStateBasedOnSubtasksIfNeeded {
    if (0 == self.subtasks.count) {
        return;
    }
    
    BOOL isCompleted = YES;
    for (Task *subtask in self.subtasks) {
        if (NO == subtask.isCompleted) {
            isCompleted = NO;
            break;
        }
    }
    
    self.isCompleted = isCompleted;;
}

@end

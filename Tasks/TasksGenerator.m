//
//  TasksGenerator.m
//  Tasks
//
//  Created by Evgeny on 13.09.2022.
//  Copyright © 2022 Cultured Code. All rights reserved.
//

#import "TasksGenerator.h"
#import "Task.h"


static NSString *TitleKey = @"title";
static NSString *SubtasksKey = @"subtasks";

@implementation TasksGenerator

+ (NSArray<Task *> *)generateTasks {
    NSArray<NSDictionary<NSString *, id> *> *taskDescriptions =
    @[
        @{ TitleKey : @"Buy milk"},
        @{ TitleKey : @"Pay rent"},
        @{ TitleKey : @"Change tires"},
        @{ TitleKey : @"Sleep",
           SubtasksKey :
               @[
                   @{ TitleKey : @"Find a bed"},
                   @{ TitleKey : @"Lie down"},
                   @{ TitleKey : @"Close eyes"},
                   @{ TitleKey : @"Wait"}
               ]
        },
        @{ TitleKey : @"Dance"}
    ];
    
    return [self tasksFromDescriptions:taskDescriptions];
}

+ (NSArray<Task *> *)tasksFromDescriptions:(NSArray<NSDictionary<NSString *, id> *> *)taskDescriptions {
    if (nil == taskDescriptions) {
        return nil;
    }
    
    NSMutableArray *tasks = [NSMutableArray array];

    for (NSDictionary *taskDescription in taskDescriptions) {
        NSArray<NSDictionary<NSString *, id> *> *const subtasksDescriptions = taskDescription[SubtasksKey];

        Task *const task =
        [[Task alloc] initWithTitle:taskDescription[TitleKey]
                        isCompleted:NO
                           subtasks:[self tasksFromDescriptions:subtasksDescriptions]];

        [tasks addObject:task];
    }
    
    return tasks;
}

@end

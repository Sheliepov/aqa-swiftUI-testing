//
//  TasksViewController.h
//  Tasks
//
//  Created by Evgeny on 13.09.2022.
//  Copyright © 2022 Cultured Code. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@class Task;

@interface TasksViewController : UITableViewController

@property (nonatomic) void (^logoutActionBlock)(void);

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithStyle:(UITableViewStyle)style NS_UNAVAILABLE;
- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil
                         bundle:(nullable NSBundle *)nibBundleOrNil NS_UNAVAILABLE;
- (nullable instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;

- (instancetype)initWithTasks:(NSArray<Task *> *)tasks NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END

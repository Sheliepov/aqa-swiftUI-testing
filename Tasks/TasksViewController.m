//
//  TasksViewController.m
//  Tasks
//
//  Created by Evgeny on 13.09.2022.
//  Copyright © 2022 Cultured Code. All rights reserved.
//

#import "TasksViewController.h"
#import "TaskTableViewCell.h"
#import "Task.h"
#import "Settings.h"
#import "Macros.h"


static NSString *const TaskTableViewCellIdentifier = @"TaskTableViewCellIdentifier";

@interface TasksViewController ()

@property (nonatomic) NSArray<Task *> *tasks;
@property (nonatomic, readonly) UIBarButtonItem *completeTasksBarButtonItem;
@property (nonatomic, readonly) UIBarButtonItem *cancelTasksBarButtonItem;
@property (nonatomic, readonly) UIBarButtonItem *sortTasksByNameBarButtonItem;
@property (nonatomic, readonly) UIBarButtonItem *flexibleSpaceBarButtonItem;
@property (nonatomic, readonly) UIBarButtonItem *logoutBarButtonItem;
@property (nonatomic) BOOL isCompleteBarButtonState;

@end

@implementation TasksViewController

- (instancetype)initWithTasks:(NSArray *)tasks {
    NSParameterAssert(tasks.count > 0);
    
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self != nil) {
        _tasks = tasks;
        
        self.title = NSLocalizedString(@"Tasks", @"Tasks view title");
        
        _completeTasksBarButtonItem =
        [[UIBarButtonItem alloc]
         initWithTitle:NSLocalizedString(@"Complete All", @"Tasks view 'complete all tasks' button title")
         style:UIBarButtonItemStylePlain
         target:self
         action:@selector(completeTasksAction)];
        
        _cancelTasksBarButtonItem =
        [[UIBarButtonItem alloc]
         initWithTitle:NSLocalizedString(@"Cancel All", @"Tasks view 'cancel all tasks' button title")
         style:UIBarButtonItemStylePlain
         target:self
         action:@selector(cancelTasksAction)];
        _cancelTasksBarButtonItem.accessibilityIdentifier = @"cancel-tasks-bar-button-item";
        
        _sortTasksByNameBarButtonItem =
        [[UIBarButtonItem alloc]
         initWithTitle:NSLocalizedString(@"Sort by Name", @"Tasks view 'sort tasks by name' button title")
         style:UIBarButtonItemStylePlain
         target:self
         action:@selector(sortTasksByNameAction)];
        _sortTasksByNameBarButtonItem.accessibilityIdentifier = @"sort-tasks-bar-button-item";
        
        _flexibleSpaceBarButtonItem =
        [[UIBarButtonItem alloc]
         initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
         target:nil
         action:nil];
        
        UIButton *button = [UIButton new];
        [button setTitleColor:UIColor.redColor forState:UIControlStateNormal];
        [button setTitle:NSLocalizedString(@"Logout", @"Tasks view 'Logout' button title") forState:UIControlStateNormal];
        [button addTarget:self
                   action:@selector(logoutAction)
         forControlEvents:UIControlEventTouchUpInside];
        _logoutBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        
        if (UIUserInterfaceIdiomPhone == self.traitCollection.userInterfaceIdiom) {
            self.navigationItem.rightBarButtonItem = self.logoutBarButtonItem;
        }
        
        self.isCompleteBarButtonState = YES;
        
        [self.tableView registerClass:[TaskTableViewCell class]
               forCellReuseIdentifier:TaskTableViewCellIdentifier];
    }
    
    return self;
}

- (void)setIsCompleteBarButtonState:(BOOL)isCompleteBarButtonState {
    if (_isCompleteBarButtonState == isCompleteBarButtonState) {
        return;
    }
    
    _isCompleteBarButtonState = isCompleteBarButtonState;
    
    [self updateToolbarItems];
}

#pragma mark - View

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     
    if ([self shouldSyncTasksState]) {
        for (Task *task in self.tasks) {
            [task updateIsCompletedStateBasedOnSubtasksIfNeeded];
        }
    }
    
    [self.tableView reloadData];
    
    self.navigationController.toolbarHidden = NO;
}

- (void)updateToolbarItems {
    NSMutableArray<UIBarButtonItem *> *toolbarItems = [NSMutableArray new];
    
    if (self.isCompleteBarButtonState) {
        [toolbarItems addObject:self.completeTasksBarButtonItem];
    }
    else {
        [toolbarItems addObject:self.cancelTasksBarButtonItem];
    }
    
    [toolbarItems addObject:self.sortTasksByNameBarButtonItem];

    if (UIUserInterfaceIdiomPad == self.traitCollection.userInterfaceIdiom) {
        [toolbarItems addObject:self.flexibleSpaceBarButtonItem];
        [toolbarItems addObject:self.logoutBarButtonItem];
    }
    
    self.toolbarItems = toolbarItems;
}

#pragma mark - UITableViewDataSource / UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Task *const task = self.tasks[indexPath.row];
    
    TaskTableViewCell *const cell =
    [tableView dequeueReusableCellWithIdentifier:TaskTableViewCellIdentifier forIndexPath:indexPath];
    NSParameterAssert([cell isKindOfClass:TaskTableViewCell.class]);
    
    cell.accessoryType =
    task.subtasks.count > 0 ? UITableViewCellAccessoryDetailDisclosureButton : UITableViewCellAccessoryNone;
    cell.textLabel.text = task.title;
    [cell setIsCompleted:task.isCompleted];
    [cell setIsNonSemanticTextColor:[Settings.sharedInstance argBoolForKey:@"dark-mode-is-broken"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if ([Settings.sharedInstance argBoolForKey:@"select_previous_cell"]) {
        NSInteger row = indexPath.row;
        row = row > 0 ? row - 1 : self.tasks.count - 1;
        indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    }
    
    Task *const task = self.tasks[indexPath.row];
    [self setTask:task isCompleted:NO == task.isCompleted];
    
    [tableView reloadRowsAtIndexPaths:@[indexPath]
                     withRowAnimation:UITableViewRowAnimationFade];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    Task *const task = self.tasks[indexPath.row];
    
    TasksViewController *viewController =
    [[TasksViewController alloc] initWithTasks:task.subtasks];
    viewController.title = task.title;
    viewController.logoutActionBlock = self.logoutActionBlock;
    
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - Actions

- (void)completeTasksAction {
    [self setAllTasksIsCompleted:YES];

    if ([Settings.sharedInstance argBoolForKey:@"complete_all_highlights_text_only"]) {
        for (TaskTableViewCell *cell in self.tableView.visibleCells) {
            [cell setIsTextHighlighted:YES];
        }
    }
    else {
        [self.tableView reloadData];
    }
    
    if (NO == [Settings.sharedInstance argBoolForKey:@"complete-all-no-switch"]) {
        self.isCompleteBarButtonState = NO;
    }
}

- (void)cancelTasksAction {
    [self setAllTasksIsCompleted:NO];

    [self.tableView reloadData];
    
    self.isCompleteBarButtonState = YES;
}

- (void)sortTasksByNameAction {
    NSComparator comparator = nil;
    
    if ([Settings.sharedInstance argBoolForKey:@"sort_random_and_select_cells"]) {
        comparator = ^NSComparisonResult(Task *task1, Task *task2) {
            return ((NSComparisonResult)arc4random_uniform(3)) - 1;
        };
        
        [self setAllTasksIsCompleted:YES];
    }
    else {
        comparator = ^NSComparisonResult(Task *task1, Task *task2) {
            return [task1.title caseInsensitiveCompare:task2.title];
        };
    }

    self.tasks = [self.tasks sortedArrayUsingComparator:comparator];
    
    [self.tableView reloadData];
}

- (void)logoutAction {
    UIAlertController *alertController =
    [UIAlertController
     alertControllerWithTitle:nil
     message:NSLocalizedString(@"Do you really want to logout?", @"Logout confirmation alert title")
     preferredStyle:UIAlertControllerStyleAlert];

    [alertController addAction:
     [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", @"Logout confirmation alert button title")
                              style:UIAlertActionStyleCancel
                            handler:nil]];
    
    RDWeakifySelf;
    [alertController addAction:
     [UIAlertAction actionWithTitle:NSLocalizedString(@"Logout", @"Logout confirmation alert button title")
                              style:UIAlertActionStyleDestructive
                            handler:^(UIAlertAction *action)
      {
        RDStrongifySelfAndReturnIfNil
        
        if (nil != strongSelf.logoutActionBlock) {
            strongSelf.logoutActionBlock();
        }
    }]];

    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - Utils

- (void)setAllTasksIsCompleted:(BOOL)isCompleted {
    for (Task *task in self.tasks) {
        [self setTask:task isCompleted:isCompleted];
    }
}

- (void)setTask:(Task *)task isCompleted:(BOOL)isCompleted {
    [task setIsCompleted:isCompleted
          updateSubtasks:[self shouldSyncTasksState]];
}

- (BOOL)shouldSyncTasksState {
    return NO == [Settings.sharedInstance argBoolForKey:@"parent-out-of-sync-with-children"];
}

@end

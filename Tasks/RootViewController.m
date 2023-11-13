//
//  RootViewController.m
//  Tasks
//
//  Created by Evgeny on 15.09.2022.
//  Copyright © 2022 Cultured Code. All rights reserved.
//

#import "RootViewController.h"
#import "LoginViewController.h"
#import "LoginProgressViewController.h"
#import "TasksViewController.h"
#import "TasksGenerator.h"
#import "Settings.h"
#import "Macros.h"


@implementation RootViewController

- (instancetype)init {
    self = [super initWithNibName:nil bundle:nil];
    
    if (nil != self) {
        if ([Settings.sharedInstance isLoginSucceeded]) {
            [self showTasksViewController];
        }
        else {
            [self showLoginViewController];
        }
    }
    
    return self;
}

- (void)showLoginViewController {
    LoginViewController *loginViewController = [LoginViewController new];
    RDWeakifySelf;
    loginViewController.loginSucceessBlock = ^{
        [weakSelf showLoginProgressViewCntroller];
    };
    self.viewControllers = @[loginViewController];
}

- (void)showLoginProgressViewCntroller {
    LoginProgressViewController *loginProgressViewController = [LoginProgressViewController new];
    RDWeakifySelf;
    loginProgressViewController.loginCanceledBlock = ^{
        [weakSelf showLoginViewController];
    };
    loginProgressViewController.loginCompletedBlock = ^{
        Settings.sharedInstance.isLoginSucceeded = YES;
        [weakSelf showTasksViewController];
    };
    self.viewControllers = @[loginProgressViewController];
}

- (void)showTasksViewController {
    TasksViewController *tasksViewController =
    [[TasksViewController alloc] initWithTasks:[TasksGenerator generateTasks]];
    RDWeakifySelf;
    tasksViewController.logoutActionBlock = ^{
        Settings.sharedInstance.isLoginSucceeded = NO;
        [weakSelf showLoginViewController];
    };
    self.viewControllers = @[tasksViewController];
}

@end

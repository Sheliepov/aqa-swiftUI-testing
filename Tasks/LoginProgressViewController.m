//
//  LoginProgressViewController.m
//  Tasks
//
//  Created by Evgeny on 16.09.2022.
//  Copyright © 2022 Cultured Code. All rights reserved.
//

#import "LoginProgressViewController.h"
#import "Settings.h"
#import "Macros.h"


@interface LoginProgressViewController ()

@property (nonatomic) UILabel *label;
@property (nonatomic) UIActivityIndicatorView *activityIndicatorView;

@end

@implementation LoginProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.systemBackgroundColor;
    
    self.label = [UILabel new];
    self.label.text = NSLocalizedString(@"Logging in...", @"Login progress label text");
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    self.label.accessibilityIdentifier = @"login-label";
    [self.view addSubview:self.label];
    
    self.activityIndicatorView =
    [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    self.activityIndicatorView.translatesAutoresizingMaskIntoConstraints = NO;
    self.activityIndicatorView.accessibilityIdentifier = @"login-activity-indicator";
    [self.view addSubview:self.activityIndicatorView];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.label.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.label.bottomAnchor constraintEqualToAnchor:self.activityIndicatorView.topAnchor constant:-20],
        
        [self.activityIndicatorView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.activityIndicatorView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:20]
    ]];
    
    [self startLogingProgress];
}

- (void)startLogingProgress {
    [self.activityIndicatorView startAnimating];
    
    RDWeakifySelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        RDStrongifySelfAndReturnIfNil

        [strongSelf.activityIndicatorView stopAnimating];
        
        if ([Settings.sharedInstance argBoolForKey:@"login-error"]) {
            [strongSelf handleLoginError];
        }
        else {
            [strongSelf handleLoginCompletion];
        }
    });
}

- (void)handleLoginError {
    UIAlertController *alertController =
    [UIAlertController
     alertControllerWithTitle:NSLocalizedString(@"Error", @"Login error alert title")
     message:NSLocalizedString(@"Unexpected login error occured", @"Login error alert message")
     preferredStyle:UIAlertControllerStyleAlert];

    RDWeakifySelf;
    [alertController addAction:
     [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", @"Login error alert button title")
                              style:UIAlertActionStyleCancel
                            handler:^(UIAlertAction *action)
      {
        [weakSelf handleLoginCancelation];
    }]];
    
    [alertController addAction:
     [UIAlertAction actionWithTitle:NSLocalizedString(@"Retry", @"Login error alert button title")
                              style:UIAlertActionStyleDefault
                            handler:^(UIAlertAction *action)
      {
        [weakSelf startLogingProgress];
    }]];

    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)handleLoginCompletion {
    if (nil != self.loginCompletedBlock) {
        self.loginCompletedBlock();
    }
}

- (void)handleLoginCancelation {
    if (nil != self.loginCanceledBlock) {
        self.loginCanceledBlock();
    }
}

@end

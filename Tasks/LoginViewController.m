//
//  LoginViewController.m
//  Tasks
//
//  Created by Evgeny on 16.09.2022.
//  Copyright © 2022 Cultured Code. All rights reserved.
//

#import "LoginViewController.h"
#import "NSString+Email.h"


@interface LoginViewController ()

@property (nonatomic) UITextField *loginTextField;
@property (nonatomic) UITextField *passwordTextField;
@property (nonatomic) UIButton *loginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.systemBackgroundColor;
    
    self.loginTextField = [UITextField new];
    self.loginTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.loginTextField.placeholder = NSLocalizedString(@"Email", @"Login dialog 'email' placeholder");
    self.loginTextField.borderStyle = UITextBorderStyleLine;
    self.loginTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.loginTextField.accessibilityIdentifier = @"login-text-field";
    [self.loginTextField
     addTarget:self
     action:@selector(textFieldDidChangeAction:)
     forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:self.loginTextField];
    
    self.passwordTextField = [UITextField new];
    self.passwordTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.passwordTextField.secureTextEntry = YES;
    self.passwordTextField.placeholder = NSLocalizedString(@"Password", @"Login dialog 'password' placeholder");
    self.passwordTextField.borderStyle = UITextBorderStyleLine;
    self.passwordTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.loginTextField.accessibilityIdentifier = @"password-text-field";
    [self.passwordTextField
     addTarget:self
     action:@selector(textFieldDidChangeAction:)
     forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:self.passwordTextField];

    self.loginButton = [UIButton new];
    [self.loginButton setTitle:NSLocalizedString(@"Login", @"Login dialog button title")
                      forState:UIControlStateNormal];
    [self.loginButton setTitleColor:UIColor.whiteColor
                           forState:UIControlStateNormal];
    self.loginButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.loginButton.accessibilityIdentifier = @"login-button";
    [self.loginButton
     addTarget:self
     action:@selector(loginAction)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginButton];
    
    [self updateLoginButtonState];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.loginTextField.bottomAnchor constraintEqualToAnchor:self.passwordTextField.topAnchor constant:-20],
        [self.loginTextField.widthAnchor constraintEqualToAnchor:self.passwordTextField.widthAnchor],
        [self.loginTextField.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],

        [self.passwordTextField.widthAnchor constraintEqualToConstant:200],
        [self.passwordTextField.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
        [self.passwordTextField.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],

        [self.loginButton.topAnchor constraintEqualToAnchor:self.passwordTextField.bottomAnchor constant:44],
        [self.loginButton.widthAnchor constraintEqualToAnchor:self.passwordTextField.widthAnchor],
        [self.loginButton.heightAnchor constraintEqualToConstant:44],
        [self.loginButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor]
    ]];
}

#pragma mark - Actions

- (void)loginAction {
    const BOOL badLogin = NO == [NSString isStringMail:self.loginTextField.text];
    const BOOL badPassword = (0 == self.passwordTextField.text.length);
    
    if (badLogin || badPassword) {
        UIAlertController *alertController =
        [UIAlertController
         alertControllerWithTitle:NSLocalizedString(@"Error", @"Login error alert title")
         message:NSLocalizedString(@"Incorrect login or password format", @"Login error alert message")
         preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController addAction:
         [UIAlertAction actionWithTitle:NSLocalizedString(@"Ok", @"Login error alert button title")
                                  style:UIAlertActionStyleDefault
                                handler:nil]];
        
        [self presentViewController:alertController
                           animated:YES
                         completion:nil];
        
        return;
    }
    
    if (nil != self.loginSucceessBlock) {
        self.loginSucceessBlock();
    }
}

- (void)textFieldDidChangeAction:(UITextField *)textField {
    [self updateLoginButtonState];
}

- (void)updateLoginButtonState {
    self.loginButton.enabled =
    self.loginTextField.text.length > 0 &&
    self.passwordTextField.text.length > 0;
    
    self.loginButton.backgroundColor = self.loginButton.enabled ? UIColor.systemBlueColor : UIColor.systemGrayColor;
}

@end

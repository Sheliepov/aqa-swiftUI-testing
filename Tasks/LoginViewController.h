//
//  LoginViewController.h
//  Tasks
//
//  Created by Evgeny on 16.09.2022.
//  Copyright © 2022 Cultured Code. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController

@property (nonatomic) void (^loginSucceessBlock)(void);

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil
                         bundle:(nullable NSBundle *)nibBundleOrNil NS_UNAVAILABLE;
- (nullable instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END

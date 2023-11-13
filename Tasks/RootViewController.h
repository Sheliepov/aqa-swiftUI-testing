//
//  RootViewController.h
//  Tasks
//
//  Created by Evgeny on 15.09.2022.
//  Copyright © 2022 Cultured Code. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@interface RootViewController : UINavigationController

- (instancetype)initWithNavigationBarClass:(nullable Class)navigationBarClass
                              toolbarClass:(nullable Class)toolbarClass NS_UNAVAILABLE;
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController NS_UNAVAILABLE;
- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil
                         bundle:(nullable NSBundle *)nibBundleOrNil NS_UNAVAILABLE;
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END

//
//  SESplashViewController.m
//  Sema
//
//  Created by Joanna Furmaniak on 12.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SESplashViewController.h"

//Account
#import "SEAccount.h"

@interface SESplashViewController ()

@end

@implementation SESplashViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self setupRootController];
}

- (void)setupRootController {
    UIViewController *rootViewController;
    
    if ([[SEAccount account] isLoggedIn]) {
        rootViewController = [[UIStoryboard storyboardWithName:@"Game" bundle:nil] instantiateViewControllerWithIdentifier:@"GameTabBarController"];
    } else {
        rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SELoginViewController"];
    }
    
    [[[UIApplication sharedApplication] keyWindow] setRootViewController:rootViewController];
}

@end

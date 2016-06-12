//
//  SESettingsViewController.m
//  Sema
//
//  Created by Joanna Furmaniak on 11.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SESettingsViewController.h"

#import "SESettingsViewModel.h"

//Views
#import "MBProgressHUD.h"


@interface SESettingsViewController ()

@property (strong, nonatomic) SESettingsViewModel *viewModel;

@end

@implementation SESettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [SESettingsViewModel new];
    [self registerForKeyboardNotifications];
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}

- (IBAction)logOutUserAction:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [self.view endEditing:YES];
    
    __weak typeof (self) wSelf = self;
    [_viewModel logoutWithCompletion:^(BOOL success, UIAlertController *alert) {
        [MBProgressHUD hideHUDForView:wSelf.view animated:YES];
        
        if (!success && alert) {
            [wSelf presentViewController:alert animated:YES completion:nil];
            
            return ;
        }
        UIViewController *loginViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SELoginViewController"];
        [wSelf presentViewController:loginViewController animated:YES completion:^{
            [[[UIApplication sharedApplication] keyWindow] setRootViewController:loginViewController];
        }];
    }];
    
}


#pragma mark -
#pragma mark - Notifications

- (void)registerForKeyboardNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardWillShowNotification  object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardDidShow:(NSNotification*)notification {
    [self.view layoutIfNeeded];
}

- (void)keyboardDidHide:(NSNotification*)notification {
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end

//
//  SEEditProfileViewController.m
//  Sema
//
//  Created by Joanna Furmaniak on 12.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEEditProfileViewController.h"
//View Model
#import "SEEditProfileViewModel.h"

//Views
#import "MBProgressHUD.h"
@interface SEEditProfileViewController ()
@property (weak, nonatomic) IBOutlet UITableViewCell *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UIView *theNewPasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *theNewPasswordConfirmationTextField;

@property (strong, nonatomic) SEEditProfileViewModel *viewModel;

@end

@implementation SEEditProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewModel = [SEEditProfileViewModel new];
    
    [self registerForKeyboardNotifications];
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}


- (IBAction)saveAction:(id)sender {
}

- (IBAction)cancelAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)tapOnViewAction:(id)sender {
    [self.view endEditing:YES];
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

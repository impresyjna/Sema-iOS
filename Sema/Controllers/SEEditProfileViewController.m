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

#import "SEAccount.h"

//Views
#import "MBProgressHUD.h"

#import "UIView+Toast.h"

@interface SEEditProfileViewController ()

@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *theNewPasswordTextField;
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

- (void)viewWillAppear:(BOOL)animated {
    _loginTextField.text = [SEAccount account].user.login;
    _emailTextField.text = [SEAccount account].user.email;
    _theNewPasswordTextField.text = @"";
    _theNewPasswordConfirmationTextField.text = @"";
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}


- (IBAction)saveAction:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [self.view endEditing:YES];
    
    __weak typeof (self) wSelf = self;
    [_viewModel updateUserWithCompletion:^(BOOL success, UIAlertController *alert) {
        [MBProgressHUD hideHUDForView:wSelf.view animated:YES];
        
        if (!success && alert) {
            [wSelf presentViewController:alert animated:YES completion:nil];
            return ;
        } else {
            [wSelf.view makeToast:@"Zaktualizowano"
                         duration:2.0
                         position:CSToastPositionCenter];
            [wSelf.navigationController popViewControllerAnimated:YES];
        }
    }];
    
}

- (IBAction)cancelAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)textFieldTextHasChangedAction:(id)sender {
    self.viewModel.email = _emailTextField.text;
    self.viewModel.login = _loginTextField.text;
    self.viewModel.password = _theNewPasswordTextField.text;
    self.viewModel.passwordConfirmation = _theNewPasswordConfirmationTextField.text;
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

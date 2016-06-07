//
//  SERegisterViewController.m
//  Sema
//
//  Created by Joanna Furmaniak on 05.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERegisterViewController.h"

//View Model
#import "SERegisterViewModel.h"

//Views
#import "MBProgressHUD.h"

@interface SERegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordConfirmationTextField;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@property (strong, nonatomic) SERegisterViewModel *viewModel;

@end

@implementation SERegisterViewController

static NSString *const SEAfterRegisterSegueID = @"SEAfterRegisterSegueID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewModel = [SERegisterViewModel new];
    
    //[self registerForKeyboardNotifications];
    // Do any additional setup after loading the view.
}


- (IBAction)cancelAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)registerAction:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [self.view endEditing:YES];
    
    __weak typeof (self) wSelf = self;
    [_viewModel registerWithCompletion:^(BOOL success, UIAlertController *alert) {
        [MBProgressHUD hideHUDForView:wSelf.view animated:YES];
        
        if (!success && alert) {
            [wSelf presentViewController:alert animated:YES completion:nil];
            
            return ;
        }
        
        [wSelf performSegueWithIdentifier:SEAfterRegisterSegueID sender:nil];
    }];
}

- (IBAction)textFieldTextHasChangedAction:(id)sender {
    self.viewModel.email = _emailTextField.text;
    self.viewModel.login = _loginTextField.text;
    self.viewModel.password = _passwordTextField.text;
    self.viewModel.passwordConfirmation = _passwordConfirmationTextField.text;
}

#pragma mark -
#pragma mark - Notifications

/* - (void)registerForKeyboardNotifications {
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
} */

@end

//
//  SELoginViewController.m
//  Sema
//
//  Created by Joanna Furmaniak on 05.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SELoginViewController.h"

#import "SELoginViewModel.h"
//Views
#import "MBProgressHUD.h"

@interface SELoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (strong, nonatomic) SELoginViewModel *viewModel;

@end

@implementation SELoginViewController

static NSString *const SEAfterLoginSegueID = @"SEAfterLoginSegueID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewModel = [SELoginViewModel new];
    
    [self registerForKeyboardNotifications];
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}

#pragma mark -
#pragma mark - Actions

- (IBAction)loginAction:(id)sender {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [self.view endEditing:YES];
    
    __weak typeof (self) wSelf = self;
    [_viewModel loginWithCompletion:^(BOOL success, UIAlertController *alert) {
        [MBProgressHUD hideHUDForView:wSelf.view animated:YES];
        
        if (!success && alert) {
            [wSelf presentViewController:alert animated:YES completion:nil];
            
            return ;
        }
        
        [wSelf performSegueWithIdentifier:SEAfterLoginSegueID sender:nil];
    }];
}

- (IBAction)textFieldTextHasChangedAction:(id)sender {
    self.viewModel.password = self.passwordTextField.text;
    self.viewModel.login = self.loginTextField.text;
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

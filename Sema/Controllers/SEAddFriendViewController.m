//
//  SEAddFriendViewController.m
//  Sema
//
//  Created by Joanna Furmaniak on 13.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEAddFriendViewController.h"

#import "SEAddFriendViewModel.h"
//Views
#import "MBProgressHUD.h"
#import "UIView+Toast.h"

@interface SEAddFriendViewController ()

@property (weak, nonatomic) IBOutlet UITextField *friendLoginTextField;

@property (strong, nonatomic) SEAddFriendViewModel *viewModel;
@end

@implementation SEAddFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [SEAddFriendViewModel new];
    [self registerForKeyboardNotifications];
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}

- (IBAction)addFriendAction:(id)sender {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [self.view endEditing:YES];
    
    __weak typeof (self) wSelf = self;
    [_viewModel addFriendWithCompletion:^(BOOL success, UIAlertController *alert) {
        [MBProgressHUD hideHUDForView:wSelf.view animated:YES];
        
        if (!success && alert) {
            [wSelf presentViewController:alert animated:YES completion:nil];
            
            return ;
        } else {
            [wSelf.view makeToast:@"Dodano przyjaciela."
                         duration:2.0
                         position:CSToastPositionCenter];
        }
    }];
    _friendLoginTextField.text = @"";
}

- (IBAction)textFieldTextHasChangedAction:(id)sender {
    self.viewModel.friendLogin = _friendLoginTextField.text;
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

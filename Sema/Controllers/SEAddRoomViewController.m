//
//  SEAddRoomViewController.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEAddRoomViewController.h"

#import "SEAddRoomViewModel.h"
//Views
#import "MBProgressHUD.h"
#import "UIView+Toast.h"

@interface SEAddRoomViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property(strong, nonatomic) SEAddRoomViewModel *viewModel;
@end

@implementation SEAddRoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [SEAddRoomViewModel new];
    [self registerForKeyboardNotifications];
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}

#pragma mark -
#pragma mark - Actions

- (IBAction)addNewRoomAction:(id)sender {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [self.view endEditing:YES];
    
    __weak typeof (self) wSelf = self;
    [_viewModel addNewRoomWithCompletion:^(BOOL success, UIAlertController *alert) {
        [MBProgressHUD hideHUDForView:wSelf.view animated:YES];
        
        if (!success && alert) {
            [wSelf presentViewController:alert animated:YES completion:nil];
            
            return ;
        } else {
            [wSelf.view makeToast:@"Pokój utworzony"
                         duration:2.0
                         position:CSToastPositionCenter];
        }
    }];
    _nameTextField.text = @"";
}

- (IBAction)textFieldTextHasChangedAction:(id)sender {
    self.viewModel.name = self.nameTextField.text;
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

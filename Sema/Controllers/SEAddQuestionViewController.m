//
//  SEAddQuestionViewController.m
//  Sema
//
//  Created by Joanna Furmaniak on 11.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEAddQuestionViewController.h"

#import "SEAddQuestionViewModel.h"
//Views
#import "MBProgressHUD.h"
#import "UIView+Toast.h"

@interface SEAddQuestionViewController ()

@property (weak, nonatomic) IBOutlet UITextField *questionContentTextView;

@property(strong, nonatomic) SEAddQuestionViewModel *viewModel;
@end

@implementation SEAddQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [SEAddQuestionViewModel new];
    [self registerForKeyboardNotifications];
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}

#pragma mark -
#pragma mark - Actions

- (IBAction)addNewQuestionAction:(id)sender {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [self.view endEditing:YES];
    
    __weak typeof (self) wSelf = self;
    [_viewModel addQuestionWithCompletion:^(BOOL success, UIAlertController *alert) {
        [MBProgressHUD hideHUDForView:wSelf.view animated:YES];
        
        if (!success && alert) {
            [wSelf presentViewController:alert animated:YES completion:nil];
            
            return ;
        } else {
            [wSelf.view makeToast:@"Zgłoszenie zostało przyjęte."
                        duration:2.0
                        position:CSToastPositionCenter];
            _questionContentTextView.text = @""; 
        }
    }];
}

- (IBAction)textFieldTextHasChangedAction:(id)sender {
    self.viewModel.content = self.questionContentTextView.text;
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

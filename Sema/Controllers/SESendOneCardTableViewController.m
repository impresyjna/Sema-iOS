//
//  SEOneCardTableViewController.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SESendOneCardTableViewController.h"

#import "SEQuestionCell.h"

//Views
#import "MBProgressHUD.h"

#import "UIView+Toast.h"

@interface SESendOneCardTableViewController ()

@end

@implementation SESendOneCardTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Initialize Refresh Control
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    // Configure Refresh Control
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    
    [self.tableView registerNib:[SEQuestionCell nib]
         forCellReuseIdentifier:[SEQuestionCell reuseIdentifier]];
    
    self.tableView.rowHeight = [SEQuestionCell height];
    [self reloadData];
}

- (void)refresh:(UIRefreshControl *)refreshControl {
    // Do your job, when done:
    [self reloadData];
    [refreshControl endRefreshing];
}

- (void)reloadData {
 
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfQuestions];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseIdentifier = [SEQuestionCell reuseIdentifier];
    SEQuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    SEQuestionCellViewModel *cellViewModel = [self.viewModel cellViewModelForIndexPath:indexPath];
    [cell populateWithViewModel:cellViewModel colorMode:0];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _viewModel.question = [self.viewModel questionInCardForIndexPath:indexPath];
    
    __weak typeof (self) wSelf = self;
    [_viewModel updateGameCardWithCompletion:^(BOOL success, UIAlertController *alert) {
        [MBProgressHUD hideHUDForView:wSelf.view animated:YES];
        
        if (!success && alert) {
            [wSelf presentViewController:alert animated:YES completion:nil];
            return ;
        } else {
            [wSelf.view makeToast:@"Wysłano"
                         duration:2.0
                         position:CSToastPositionCenter];
            [wSelf.navigationController popViewControllerAnimated:YES];
        }
    }];
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSString *)navigationTitle {
    return @""; 
}


@end

//
//  SEChooseWhoToSendTableViewController.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEChooseWhoToSendTableViewController.h"
#import "SESendCardViewController.h"

#import "SELoginViewController.h"
#import "SERegisterViewController.h"

#import "SERoomUserCell.h"

#import "SEPageViewControllerDataSource.h"

//Views
#import "MBProgressHUD.h"

@interface SEChooseWhoToSendTableViewController ()
@property (nonatomic, strong) NSArray <UIViewController *> *controllers;
@end

@implementation SEChooseWhoToSendTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Initialize Refresh Control
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    
    // Configure Refresh Control
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    
    [self.tableView registerNib:[SERoomUserCell nib]
         forCellReuseIdentifier:[SERoomUserCell reuseIdentifier]];
    
    self.tableView.rowHeight = [SERoomUserCell height];
    [self reloadData];
}

- (void)refresh:(UIRefreshControl *)refreshControl {
    // Do your job, when done:
    [self reloadData];
    [refreshControl endRefreshing];
}


- (void)reloadData {
    __weak typeof (self) wSelf = self;
    [_viewModel fetchRoomUsersWithCompletionBlock:^(NSArray<SERoomUser *> *roomUsers, UIAlertController *alert) {
        if (alert) {
            [wSelf presentViewController:alert animated:YES completion:nil];
            return ;
        }
        
        [wSelf.tableView reloadData];
    }];
}

#pragma mark -
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfRoomUsers];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseIdentifier = [SERoomUserCell reuseIdentifier];
    SERoomUserCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    SERoomUserCellViewModel *cellViewModel = [self.viewModel cellViewModelForIndexPath:indexPath];
    [cell populateWithViewModel:cellViewModel];
    
    return cell;
}

#pragma mark -
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //SERoomUser *roomUser = [self.viewModel roomUserForIndexPath:indexPath];
    SESendCardViewController *roomViewController = [[UIStoryboard storyboardWithName:@"Game" bundle:nil] instantiateViewControllerWithIdentifier:@"SendCard"];
    SELoginViewController *loginController = [SELoginViewController new];
    SERegisterViewController *registerController = [SERegisterViewController new];
    _controllers = @[loginController, registerController];
    roomViewController.dataSource = [[SEPageViewControllerDataSource alloc] initWithControllers:_controllers];
    [self.navigationController pushViewController:roomViewController animated:YES];
}

@end

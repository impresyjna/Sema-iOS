//
//  SERoomViewController.m
//  Sema
//
//  Created by Joanna Furmaniak on 14.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERoomViewController.h"

#import "SERoomUserCell.h"

@interface SERoomViewController ()

@end

@implementation SERoomViewController

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

- (IBAction)joinRoomAction:(id)sender {
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
    SERoomUser *roomUser = [self.viewModel roomUserForIndexPath:indexPath];
    //[self.navigationController pushViewController:<#(nonnull UIViewController *)#> animated:<#(BOOL)#>]
    //[self.delegate loginPicker:self didPickActionSubject:friendship];
}

@end

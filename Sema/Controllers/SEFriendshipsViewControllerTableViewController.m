//
//  SEFriendshipsViewControllerTableViewController.m
//  Sema
//
//  Created by Joanna Furmaniak on 13.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEFriendshipsViewControllerTableViewController.h"

#import "SEFriendshipViewModel.h"

//View
#import "SEFriendshipCell.h"

@interface SEFriendshipsViewControllerTableViewController ()

@property (nonatomic, strong) SEFriendshipViewModel *viewModel;

@end

@implementation SEFriendshipsViewControllerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Initialize Refresh Control
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    
    // Configure Refresh Control
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    
    [self.tableView registerNib:[SEFriendshipCell nib]
         forCellReuseIdentifier:[SEFriendshipCell reuseIdentifier]];
    
    self.tableView.rowHeight = [SEFriendshipCell height];
    
    [self setupViewModel];
}

- (void)refresh:(UIRefreshControl *)refreshControl {
    // Do your job, when done:
    [self setupViewModel];
    [refreshControl endRefreshing];
}

- (void)setupViewModel {
    _viewModel = [SEFriendshipViewModel new];
    
    __weak typeof (self) wSelf = self;
    [_viewModel fetchFriendshipsWithCompletionBlock:^(NSArray<SEFriendship *> *friendships, UIAlertController *alert) {
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
    return [self.viewModel numberOfFriendships];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseIdentifier = [SEFriendshipCell reuseIdentifier];
    SEFriendshipCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    SEFriendshipCellViewModel *cellViewModel = [self.viewModel cellViewModelForIndexPath:indexPath];
    [cell populateWithViewModel:cellViewModel];
    
    return cell;
}

#pragma mark -
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //SEFriendship *friendship = [self.viewModel friendshipForIndexPath:indexPath];
    
    //[self.delegate loginPicker:self didPickActionSubject:friendship];
    [self.navigationController popViewControllerAnimated:YES];
}



@end

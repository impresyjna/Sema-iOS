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
    
    [self.tableView registerNib:[SEFriendshipCell nib]
         forCellReuseIdentifier:[SEFriendshipCell reuseIdentifier]];
    
    self.tableView.rowHeight = [SEFriendshipCell height];
    
    [self setupViewModel];
}

- (void)setupViewModel {
    _viewModel = [SEFriendshipViewModel new];
    
    __weak typeof (self) wSelf = self;
    [_viewModel fetchFriendshipsWithCompletionBlock:^(NSArray<SEFriendship *> *subjects, UIAlertController *alert) {
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
    return [self.viewModel numberOfSubjects];
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
    SEFriendship *friendship = [self.viewModel friendshipForIndexPath:indexPath];
    
    //[self.delegate loginPicker:self didPickActionSubject:friendship];
    [self.navigationController popViewControllerAnimated:YES];
}



@end

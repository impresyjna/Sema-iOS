//
//  SERoomsViewControllerTableViewController.m
//  Sema
//
//  Created by Joanna Furmaniak on 14.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERoomsViewController.h"
#import "SERoomViewController.h"

#import "SERoomsViewModel.h"
#import "SERoomViewModel.h"

#import "SERoomCell.h"


@interface SERoomsViewController ()

@property (nonatomic, strong) SERoomsViewModel *viewModel;

@end

@implementation SERoomsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Initialize Refresh Control
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    
    // Configure Refresh Control
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    
    [self.tableView registerNib:[SERoomCell nib]
         forCellReuseIdentifier:[SERoomCell reuseIdentifier]];
    
    self.tableView.rowHeight = [SERoomCell height];
    
    [self setupViewModel];
}

- (void)refresh:(UIRefreshControl *)refreshControl {
    // Do your job, when done:
    [self setupViewModel];
    [refreshControl endRefreshing];
}

- (void)setupViewModel {
    _viewModel = [SERoomsViewModel new];
    
    __weak typeof (self) wSelf = self;
    [_viewModel fetchRoomsWithCompletionBlock:^(NSArray<SERoom *> *rooms, UIAlertController *alert) {
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
    return [self.viewModel numberOfRooms];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseIdentifier = [SERoomCell reuseIdentifier];
    SERoomCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    SERoomCellViewModel *cellViewModel = [self.viewModel cellViewModelForIndexPath:indexPath];
    [cell populateWithViewModel:cellViewModel];
    
    return cell;
}

#pragma mark -
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SERoom *room = [self.viewModel roomForIndexPath:indexPath];
    SERoomViewModel *roomViewModel = [[SERoomViewModel alloc] initWithRoom:room];
    SERoomViewController *roomViewController = [[UIStoryboard storyboardWithName:@"Game" bundle:nil] instantiateViewControllerWithIdentifier:@"RoomView"];
    roomViewController.viewModel = roomViewModel;
    [self.navigationController pushViewController:roomViewController animated:YES];
}
@end

//
//  SEReceiveOneCardTableViewController.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEReceiveOneCardTableViewController.h"

#import "SEQuestionCell.h"
#import "SEQuestion.h"

//Views
#import "MBProgressHUD.h"

#import "UIView+Toast.h"

@interface SEReceiveOneCardTableViewController ()

@end

@implementation SEReceiveOneCardTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Initialize Refresh Control
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    self.automaticallyAdjustsScrollViewInsets = YES;
    // Configure Refresh Control
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
    
    [self.tableView registerNib:[SEQuestionCell nib]
         forCellReuseIdentifier:[SEQuestionCell reuseIdentifier]];
    self.navigationItem.title = _viewModel.card.senderLogin; 
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

- (IBAction)acceptCardAction:(id)sender {
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
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfQuestions];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseIdentifier = [SEQuestionCell reuseIdentifier];
    SEQuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    SEQuestionCellViewModel *cellViewModel = [self.viewModel cellViewModelForIndexPath:indexPath];
    SEQuestionInCard *question = [self.viewModel questionInCardForIndexPath:indexPath];
    if([_viewModel.card.questionNumber integerValue] == [question.cardNumber integerValue]) {
        [cell populateWithViewModel:cellViewModel colorMode:1];
    } else {
        [cell populateWithViewModel:cellViewModel colorMode:0];
    }
    
    return cell;
}

-(NSString *)navigationTitle {
    return _viewModel.card.senderLogin; 
}

@end

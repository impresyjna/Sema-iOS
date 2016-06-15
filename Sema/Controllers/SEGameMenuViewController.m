//
//  SEGameMenuViewController.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEGameMenuViewController.h"
#import "SEChooseWhoToSendTableViewController.h"

#import "SEChooseWhoToSendViewModel.h"

@interface SEGameMenuViewController ()

@end

@implementation SEGameMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)chooseWhoToSendAction:(id)sender {
    SERoom *room = self.viewModel.room;
    SEChooseWhoToSendViewModel *roomViewModel = [[SEChooseWhoToSendViewModel alloc] initWithRoom:room];
    SEChooseWhoToSendTableViewController *roomViewController = [[UIStoryboard storyboardWithName:@"Game" bundle:nil] instantiateViewControllerWithIdentifier:@"ChooseWhoToSend"];
    roomViewController.viewModel = roomViewModel;
    [self.navigationController pushViewController:roomViewController animated:YES];
}


@end

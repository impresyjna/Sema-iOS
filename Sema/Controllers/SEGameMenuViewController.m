//
//  SEGameMenuViewController.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEGameMenuViewController.h"
#import "SEChooseWhoToSendTableViewController.h"
#import "SEReceiveOneCardTableViewController.h"

#import "SEChooseWhoToSendViewModel.h"
#import "SEReceiveOneCardViewModel.h"
#import "SESendCardViewController.h"

#import "UIView+Toast.h"

//Views
#import "MBProgressHUD.h"

@interface SEGameMenuViewController ()

@end

@implementation SEGameMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)receiveCardsAction:(id)sender {
    NSMutableArray <UIViewController <SECardControllerProtocol> *> *controllers = [NSMutableArray new];
    __weak typeof (self) wSelf = self;
    [_viewModel fetchGameCardsWithCompletionBlock:^(NSArray<SEGameCard *> *gameCards, UIAlertController *alert) {
        SESendCardViewController *receiveCardViewController = [[UIStoryboard storyboardWithName:@"Game" bundle:nil] instantiateViewControllerWithIdentifier:@"SendCard"];
        if([gameCards count]==0) {
            [wSelf.view makeToast:@"Brak nowych wiadomości"
                         duration:2.0
                         position:CSToastPositionCenter];
        } else {
        for(SEGameCard *gameCard in gameCards) {
            SEReceiveOneCardTableViewController *receiveOneCardViewController = [[UIStoryboard storyboardWithName:@"Game" bundle:nil] instantiateViewControllerWithIdentifier:@"ReceiveOneCard"];
            SEReceiveOneCardViewModel *receiveOneViewModel = [[SEReceiveOneCardViewModel alloc] initWithRoom:wSelf.viewModel.room card:gameCard];
            receiveOneCardViewController.viewModel = receiveOneViewModel;
            [controllers addObject:receiveOneCardViewController];
        }
        receiveCardViewController.cardsDataSource = [[SEPageViewControllerDataSource alloc] initWithControllers:controllers];
            [wSelf.navigationController pushViewController:receiveCardViewController animated:YES];
        }
    }];
}

- (IBAction)chooseWhoToSendAction:(id)sender {
    SERoom *room = self.viewModel.room;
    SEChooseWhoToSendViewModel *roomViewModel = [[SEChooseWhoToSendViewModel alloc] initWithRoom:room];
    SEChooseWhoToSendTableViewController *roomViewController = [[UIStoryboard storyboardWithName:@"Game" bundle:nil] instantiateViewControllerWithIdentifier:@"ChooseWhoToSend"];
    roomViewController.viewModel = roomViewModel;
    [self.navigationController pushViewController:roomViewController animated:YES];
}

- (IBAction)leaveRoomAction:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [self.view endEditing:YES];
    
    __weak typeof (self) wSelf = self;
    [_viewModel leaveRoomWithCompletion:^(BOOL success, UIAlertController *alert) {
        [MBProgressHUD hideHUDForView:wSelf.view animated:YES];
        [wSelf.navigationController popViewControllerAnimated:YES];
    }];
}

@end

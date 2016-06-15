//
//  SEReceiveOneCardTableViewController.h
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SEReceiveOneCardViewModel.h"
#import "SEPageViewControllerDataSource.h"

@interface SEReceiveOneCardTableViewController : UITableViewController <SECardControllerProtocol>

@property (nonatomic, strong) SEReceiveOneCardViewModel *viewModel;

@end

//
//  SEOneCardTableViewController.h
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SESendOneCardViewModel.h"
#import "SEPageViewControllerDataSource.h"

@interface SESendOneCardTableViewController : UITableViewController <SECardControllerProtocol>

@property (nonatomic, strong) SESendOneCardViewModel *viewModel; 

@end

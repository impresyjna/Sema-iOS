//
//  SESendCardViewController.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SESendCardViewController.h"

@interface SESendCardViewController()<SEPageDataSourceDelegate>
@end

@implementation SESendCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = _cardsDataSource;
    _cardsDataSource.delegate = self;
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIViewController<SECardControllerProtocol> *firstController = _cardsDataSource.selectedViewController;
    self.title = firstController.navigationTitle;
    [self setViewControllers:@[firstController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

- (void)dataSource:(SEPageViewControllerDataSource *)dataSource willChangeController:(UIViewController<SECardControllerProtocol> *)viewController {
    self.title = viewController.navigationTitle;
}


@end

//
//  SESendCardViewController.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SESendCardViewController.h"

@interface SESendCardViewController ()
@end

@implementation SESendCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = _cardsDataSource;
    
    [self setViewControllers:@[_cardsDataSource.selectedViewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}


@end

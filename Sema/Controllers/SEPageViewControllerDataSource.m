//
//  SEPageViewControllerDataSource.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEPageViewControllerDataSource.h"

@implementation SEPageViewControllerDataSource

- (instancetype)initWithControllers:(NSArray <UIViewController <SECardControllerProtocol> *> *)controllers {
    self = [super init];
    if (self) {
        _controllers = controllers;
        _selectedIndex = 0;
    }
    return self;
}

- (UIViewController<SECardControllerProtocol> *)selectedViewController {
    return [_controllers objectAtIndex:_selectedIndex];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    if(_selectedIndex == 0) {
        return nil;
    }
    
    _selectedIndex = _selectedIndex - 1;
    UIViewController<SECardControllerProtocol> *selectedViewController = [self selectedViewController];
    [self.delegate dataSource:self willChangeController:selectedViewController];
    return selectedViewController;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger size = [_controllers count];
    if(_selectedIndex + 1  >= size) {
        return nil;
    }
    
    _selectedIndex = _selectedIndex + 1;
    UIViewController<SECardControllerProtocol> *selectedViewController = [self selectedViewController];
    [self.delegate dataSource:self willChangeController:selectedViewController];
    return selectedViewController;
}

@end

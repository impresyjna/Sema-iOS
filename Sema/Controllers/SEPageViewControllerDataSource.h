//
//  SEPageViewControllerDataSource.h
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SEPageViewControllerDataSource : NSObject <UIPageViewControllerDataSource>

@property (nonatomic, assign, readonly) NSUInteger selectedIndex;
@property (nonatomic, strong, readonly) NSArray <UIViewController *> *controllers;

- (UIViewController *)selectedViewController;

- (instancetype)initWithControllers:(NSArray <UIViewController *> *)controllers; 

@end

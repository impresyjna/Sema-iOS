//
//  SEPageViewControllerDataSource.h
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SEPageViewControllerDataSource;

@protocol SECardControllerProtocol

- (NSString *)navigationTitle;

@end

@protocol SEPageDataSourceDelegate

- (void)dataSource:(SEPageViewControllerDataSource *)dataSource willChangeController:(UIViewController <SECardControllerProtocol> *)viewController;

@end

@interface SEPageViewControllerDataSource : NSObject <UIPageViewControllerDataSource>
@property (nonatomic, weak) id<SEPageDataSourceDelegate> delegate; 
@property (nonatomic, assign, readonly) NSUInteger selectedIndex;
@property (nonatomic, strong, readonly) NSArray <UIViewController <SECardControllerProtocol> *> *controllers;

- (UIViewController<SECardControllerProtocol> *)selectedViewController;

- (instancetype)initWithControllers:(NSArray <UIViewController <SECardControllerProtocol> *> *)controllers; 

@end

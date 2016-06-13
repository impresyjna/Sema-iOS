//
//  SEAddFriendViewModel.h
//  Sema
//
//  Created by Joanna Furmaniak on 13.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SEAddFriendViewModelCompletionBlock)(BOOL success, UIAlertController *alert);

@interface SEAddFriendViewModel : NSObject

@property (nonatomic, strong) NSString *friendLogin;

- (void) addFriendWithCompletion:(SEAddFriendViewModelCompletionBlock)block;

@end

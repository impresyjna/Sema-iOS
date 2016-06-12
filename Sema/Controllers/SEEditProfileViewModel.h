//
//  SEEditProfileViewModel.h
//  Sema
//
//  Created by Joanna Furmaniak on 12.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SEEditUserViewModelCompletionBlock)(BOOL success, UIAlertController *alert);

@interface SEEditProfileViewModel : NSObject

@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *passwordConfirmation;

- (void) updateUserWithCompletion:(SEEditUserViewModelCompletionBlock)block;

@end

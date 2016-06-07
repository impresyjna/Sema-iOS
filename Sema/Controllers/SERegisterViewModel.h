//
//  SERegisterViewModel.h
//  Sema
//
//  Created by Joanna Furmaniak on 06.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SERegisterCompletionBlock)(BOOL success, UIAlertController *alert);

@interface SERegisterViewModel : NSObject

@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *passwordConfirmation;

- (void)registerWithCompletion:(SERegisterCompletionBlock)block;

@end

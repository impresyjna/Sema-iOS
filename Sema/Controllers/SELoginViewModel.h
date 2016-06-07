//
//  SELoginViewModel.h
//  Sema
//
//  Created by Joanna Furmaniak on 07.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SELoginViewModelCompletionBlock)(BOOL success, UIAlertController *alert);

@interface SELoginViewModel : NSObject

@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) NSString *password;

- (void) loginWithCompletion:(SELoginViewModelCompletionBlock)block;

@end

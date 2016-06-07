//
//  NSString+Validation.h
//  Sema
//
//  Created by Joanna Furmaniak on 07.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validation)

- (BOOL)isValidPassword:(NSError **)error;
- (BOOL)isValidEmail:(NSError **)error;
- (BOOL)isValidLogin:(NSError **)error;
- (BOOL)isValidPasswordConfirmation:(NSString *)password error:(NSError **)error;

@end

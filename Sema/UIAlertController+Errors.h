//
//  UIAlertController+Errors.h
//  Sema
//
//  Created by Joanna Furmaniak on 07.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Errors)

+ (instancetype)alertControllerWithError:(NSError *)error;
//
+ (UIAlertController *)alertWithErrorMessage:(NSString *)message;
@end

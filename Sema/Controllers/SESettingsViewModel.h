//
//  SESettingsViewModel.h
//  Sema
//
//  Created by Joanna Furmaniak on 11.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SESettingsViewModelCompletionBlock)(BOOL success, UIAlertController *alert);
@interface SESettingsViewModel : NSObject

- (void) logoutWithCompletion: (SESettingsViewModelCompletionBlock)block;

@end

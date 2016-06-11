//
//  SEAddQuestionViewModel.h
//  Sema
//
//  Created by Joanna Furmaniak on 11.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SEAddQuestionViewModelCompletionBlock)(BOOL success, UIAlertController *alert);

@interface SEAddQuestionViewModel : NSObject

@property (nonatomic, strong) NSString *content;

- (void) addQuestionWithCompletion:(SEAddQuestionViewModelCompletionBlock)block;
@end

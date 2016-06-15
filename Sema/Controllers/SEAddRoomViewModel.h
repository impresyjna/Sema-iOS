//
//  SEAddRoomViewModel.h
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SEAddRoomViewModelCompletionBlock)(BOOL success, UIAlertController *alert);
@interface SEAddRoomViewModel : NSObject

@property (nonatomic, strong) NSString *name;

- (void) addNewRoomWithCompletion:(SEAddRoomViewModelCompletionBlock)block;

@end

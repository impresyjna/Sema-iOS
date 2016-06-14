//
//  SERoomsViewModel.h
//  Sema
//
//  Created by Joanna Furmaniak on 14.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>

//Model
#import "SERoom.h"

//View Model
#import "SERoomCellViewModel.h"

//Service
#import "SERoomsService.h"

//Category
#import "UIAlertController+Errors.h"

typedef void(^SERoomsViewModelFetchSubjectsCompletion)(NSArray <SERoom *> *rooms, UIAlertController *alert);

@interface SERoomsViewModel : NSObject

- (NSInteger)numberOfRooms;

- (SERoom *)roomForIndexPath:(NSIndexPath *)indexPath;
- (SERoomCellViewModel *)cellViewModelForIndexPath:(NSIndexPath *)indexPath;

- (void)fetchRoomsWithCompletionBlock:(SERoomsViewModelFetchSubjectsCompletion)block;

@end

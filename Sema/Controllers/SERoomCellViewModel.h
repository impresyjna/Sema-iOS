//
//  SERoomCellViewModel.h
//  Sema
//
//  Created by Joanna Furmaniak on 14.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SERoom.h"

@interface SERoomCellViewModel : NSObject

@property (nonatomic, strong, readonly) NSString *roomName;
@property (nonatomic, strong, readonly) NSNumber *usersCount;
@property (nonatomic, strong, readonly) NSString *categoryName;

- (instancetype)initWithRoom:(SERoom *)room; 

@end

//
//  SEFriendship.h
//  Sema
//
//  Created by Joanna Furmaniak on 12.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SEUser.h"

@interface SEFriendship : NSObject

@property (nonatomic, assign, readonly) NSInteger fId;
@property (nonatomic, strong, readonly) SEUser *friend;

@end

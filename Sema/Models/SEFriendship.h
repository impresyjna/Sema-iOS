//
//  SEFriendship.h
//  Sema
//
//  Created by Joanna Furmaniak on 12.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Mantle/Mantle.h>

#import "SEUser.h"

@interface SEFriendship : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign, readonly) NSInteger fId;
@property (nonatomic, strong, readonly) SEUser *friendUser;

@end

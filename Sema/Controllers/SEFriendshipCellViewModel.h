//
//  SEFriendshipCellViewModel.h
//  Sema
//
//  Created by Joanna Furmaniak on 13.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEFriendship.h"
@interface SEFriendshipCellViewModel : NSObject

@property (nonatomic, strong, readonly) NSString *login;

- (instancetype)initWithFriendship:(SEFriendship *)friendship;

@end

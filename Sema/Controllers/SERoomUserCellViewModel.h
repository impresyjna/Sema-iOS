//
//  SERoomUserCellViewModel.h
//  Sema
//
//  Created by Joanna Furmaniak on 14.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SERoomUser.h"

@interface SERoomUserCellViewModel : NSObject

@property (nonatomic, strong, readonly) NSString *userLogin;

- (instancetype)initWithRoomUser:(SERoomUser *)roomUser;

@end

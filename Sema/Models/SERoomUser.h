//
//  SERoomUser.h
//  Sema
//
//  Created by Joanna Furmaniak on 14.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface SERoomUser : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign, readonly) NSInteger rId;
@property (nonatomic, strong, readonly) NSString *userLogin;

@end

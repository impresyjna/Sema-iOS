//
//  SEUser.h
//  Sema
//
//  Created by Joanna Furmaniak on 02.05.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface SEUser : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign, readonly) NSInteger uId;
@property (nonatomic, strong, readonly) NSString *email;
@property (nonatomic, strong, readonly) NSString *authToken;

@end

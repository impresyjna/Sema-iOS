//
//  SEFriendParams.h
//  Sema
//
//  Created by Joanna Furmaniak on 13.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SERequestParamsProtocol.h"

@interface SEFriendParams : NSObject <SERequestParamsProtocol>

@property(nonatomic, strong, readonly) NSString *friendLogin;

-(instancetype) initWithFriendLogin:(NSString *)friendLogin;

@end

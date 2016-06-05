//
//  SELoginUserParams.h
//  Sema
//
//  Created by Joanna Furmaniak on 02.05.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SERequestParamsProtocol.h"

@interface SELoginUserParams : NSObject <SERequestParamsProtocol>

@property (nonatomic, strong, readonly) NSString *login;
@property (nonatomic, strong, readonly) NSString *password;

- (instancetype)initWithLogin:(NSString *)login password:(NSString *)password;

@end

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

@property (nonatomic, strong, readonly) NSString *email;
@property (nonatomic, strong, readonly) NSString *password;

- (instancetype)initWithEmail:(NSString *)email password:(NSString *)password; 

@end

//
//  SEUser.m
//  Sema
//
//  Created by Joanna Furmaniak on 02.05.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEUser.h"

@implementation SEUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
                @"uId":@"id",
                @"email":@"email",
                @"login":@"login",
                @"authToken":@"auth_token"
             };
}

@end

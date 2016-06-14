//
//  SERoomUser.m
//  Sema
//
//  Created by Joanna Furmaniak on 14.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERoomUser.h"

@implementation SERoomUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"rId":@"id",
             @"userLogin":@"user_login"
             };
}

@end

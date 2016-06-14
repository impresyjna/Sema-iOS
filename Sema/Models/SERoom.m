//
//  SERoom.m
//  Sema
//
//  Created by Joanna Furmaniak on 14.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERoom.h"

@implementation SERoom

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"rId":@"id",
             @"name":@"name",
             @"categoryName":@"category_name",
             @"usersCount":@"users_count"
             };
}

@end

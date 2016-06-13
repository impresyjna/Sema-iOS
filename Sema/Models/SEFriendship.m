//
//  SEFriendship.m
//  Sema
//
//  Created by Joanna Furmaniak on 12.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEFriendship.h"

@implementation SEFriendship

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"fId":@"id",
             @"friend":@"friend"
             };
}

+ (NSValueTransformer *)friendURLJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:SEUser.class];
}

@end

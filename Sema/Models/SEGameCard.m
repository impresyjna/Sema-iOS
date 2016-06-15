//
//  SEGameCard.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEGameCard.h"

@implementation SEGameCard

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"cId":@"id",
             @"senderLogin":@"sender_login",
             @"questionNumber":@"question_number",
             @"card":@"card"
             };
}

+ (NSValueTransformer *)cardJSONTransformer {
    return [MTLJSONAdapter dictionaryTransformerWithModelClass:SECard.class];
}

@end

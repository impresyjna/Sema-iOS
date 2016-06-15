//
//  SECard.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SECard.h"

@implementation SECard

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"questions":@"question_in_cards"
             };
}

+ (NSValueTransformer *)questionsJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:SEQuestionInCard.class];
}

@end

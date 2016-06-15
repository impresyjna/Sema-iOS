//
//  SEQuestionInCard.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEQuestionInCard.h"

@implementation SEQuestionInCard

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"cardNumber":@"number",
             @"questionContent":@"question_content"
             };
}

@end

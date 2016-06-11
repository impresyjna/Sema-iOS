//
//  SEQuestion.m
//  Sema
//
//  Created by Joanna Furmaniak on 11.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEQuestion.h"

@implementation SEQuestion

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"qID":@"id",
             @"conent":@"conent"
             }; 
}
@end

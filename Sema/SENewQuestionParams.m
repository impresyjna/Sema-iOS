//
//  SENewQuestionParams.m
//  Sema
//
//  Created by Joanna Furmaniak on 11.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SENewQuestionParams.h"

@implementation SENewQuestionParams

- (instancetype)initWithContent:(NSString *)content {
    self = [super init];
    
    if(self) {
        _content = content;
    }
    return self;
}

- (NSDictionary *)params {
    return @{
             @"question": @{
                     @"content": _content
                     }
             };
}

@end

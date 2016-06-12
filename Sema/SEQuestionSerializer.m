//
//  SEQuestionSerializer.m
//  Sema
//
//  Created by Joanna Furmaniak on 11.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEQuestionSerializer.h"

@implementation SEQuestionSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error {
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    SEQuestion *question = [MTLJSONAdapter modelOfClass:SEQuestion.class fromJSONDictionary:json[@"question"] error:nil];
    
    NSMutableDictionary *results = [[NSMutableDictionary alloc] init];
    
    if (question) {
        [results setValue:question forKey:@"question"];
    }
    
    return results;
}


@end

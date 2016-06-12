//
//  SEUserSerializer.m
//  Sema
//
//  Created by Joanna Furmaniak on 02.05.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEUserSerializer.h"

@implementation SEUserSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error {
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    SEUser *user = [MTLJSONAdapter modelOfClass:SEUser.class fromJSONDictionary:json[@"user"] error:nil];
    
    NSMutableDictionary *results = [[NSMutableDictionary alloc] init];
    
    if (user) {
        [results setValue:user forKey:@"user"];
    }
    
    return results; 
}

@end

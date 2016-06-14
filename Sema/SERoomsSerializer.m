//
//  SERoomsSerializer.m
//  Sema
//
//  Created by Joanna Furmaniak on 14.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERoomsSerializer.h"

@implementation SERoomsSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error {
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    NSArray *rooms = @[];
    if(json[@"rooms"] != nil) {
        rooms = [MTLJSONAdapter modelsOfClass:SERoom.class fromJSONArray:json[@"rooms"] error:nil];
    }
    NSMutableDictionary *results = [[NSMutableDictionary alloc] init];
    
    if (rooms) {
        [results setValue:rooms forKey:@"rooms"];
    }
    
    return results;
}

@end

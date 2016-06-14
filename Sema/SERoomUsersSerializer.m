//
//  SERoomUsersSerializer.m
//  Sema
//
//  Created by Joanna Furmaniak on 14.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERoomUsersSerializer.h"

@implementation SERoomUsersSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error {
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    NSArray *roomUsers = @[];
    if(json[@"room_users"] != nil) {
        roomUsers = [MTLJSONAdapter modelsOfClass:SERoomUser.class fromJSONArray:json[@"room_users"] error:nil];
    }
    NSMutableDictionary *results = [[NSMutableDictionary alloc] init];
    
    if (roomUsers) {
        [results setValue:roomUsers forKey:@"room_users"];
    }
    
    return results;
}

@end

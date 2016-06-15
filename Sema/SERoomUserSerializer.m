//
//  SERoomUserSerializer.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERoomUserSerializer.h"

@implementation SERoomUserSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error {
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    SERoomUser *roomUser = [MTLJSONAdapter modelOfClass:SERoomUser.class fromJSONDictionary:json[@"room_user"] error:nil];
    
    NSMutableDictionary *results = [[NSMutableDictionary alloc] init];
    
    if (roomUser) {
        [results setValue:roomUser forKey:@"room_user"];
    }
    
    return results;
}

@end

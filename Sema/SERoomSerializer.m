//
//  SERoomSerializer.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERoomSerializer.h"

@implementation SERoomSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error {
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    SERoom *room = [MTLJSONAdapter modelOfClass:SERoom.class fromJSONDictionary:json[@"room"] error:nil];
    
    NSMutableDictionary *results = [[NSMutableDictionary alloc] init];
    
    if (room) {
        [results setValue:room forKey:@"room"];
    }
    
    return results;
}

@end

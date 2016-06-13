//
//  SEFriendshipsSerializer.m
//  Sema
//
//  Created by Joanna Furmaniak on 12.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEFriendshipsSerializer.h"

@implementation SEFriendshipsSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error {
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    NSArray *friendships = [MTLJSONAdapter modelsOfClass:SEFriendship.class fromJSONArray:json[@"friendships"] error:nil];
    NSMutableDictionary *results = [[NSMutableDictionary alloc] init];
    
    if (friendships) {
        [results setValue:friendships forKey:@"friendships"];
    }
    
    return results;
}

@end

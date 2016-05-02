//
//  SEJSONResponseSerializer.m
//  Sema
//
//  Created by Joanna Furmaniak on 02.05.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEJSONResponseSerializer.h"

@implementation SEJSONResponseSerializer

- (instancetype)init {
    self = [super init];
    if(self) {
        NSSet *set = [self.acceptableContentTypes setByAddingObject:@"application/json"];
        self.acceptableContentTypes = set;
        
        NSMutableIndexSet *statusCodesSet = [self.acceptableStatusCodes mutableCopy];
        self.acceptableStatusCodes = [statusCodesSet copy];
    }
    return self;
}

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error {
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    
    return json;
}

@end

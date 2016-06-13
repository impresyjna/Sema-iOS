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

- (id)responseObjectForResponse:(NSHTTPURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error {
    // get parsed JSON response
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    
    NSError* (^parseErrorResponse)(NSDictionary *) = ^NSError *(NSDictionary *payload) {
        NSMutableDictionary *errorHash = [json mutableCopy];
        errorHash[@"code"] = @(response.statusCode);
        
        // create model object form JSON
        NSError *adapterError = nil;
        SEError *errorObject = [MTLJSONAdapter modelOfClass:SEError.class
                                         fromJSONDictionary:errorHash
                                                      error:&adapterError];
        
        // returns error
        return adapterError ? adapterError : errorObject.error;
    };
    
    // default validation
    if (![self validateResponse:response data:data error:NULL]) {
        // handle forbidden reponse
        if (response.statusCode == 400 || response.statusCode == 401 || response.statusCode == 403 || response.statusCode == 422 || response.statusCode == 404) {
            NSError *apiError = parseErrorResponse(json);
            if (apiError != NULL) {
                *error = apiError;
            };
        }
        
        return nil;
    }
    return json;
}

@end

//
//  SEApiClient.h
//  Sema
//
//  Created by Joanna Furmaniak on 02.05.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

//Formatter
#import "TTTURLRequestFormatter.h"

@interface SEApiClient : AFHTTPSessionManager

+ (instancetype)sharedManager;

- (void)enqueueOperation:(NSOperation *)operation;

@end

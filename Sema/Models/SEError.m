//
//  SEError.m
//  Sema
//
//  Created by Joanna Furmaniak on 13.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEError.h"

@implementation SEError

- (NSError *)error {
    
    NSDictionary *userInfo = @{
                               @"message": self.messages.allValues.firstObject[0] ?: @"An error occured"
                               };
    
    return [NSError errorWithDomain:kSEErrorDomain code:self.code userInfo:userInfo];
}

#pragma mark -
#pragma mark Mappings

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"code": @"code",
             @"messages": @"errors"
             };
}

#pragma mark -
#pragma mark Others

- (void)setNilValueForKey:(NSString *)key {
    if ([key isEqualToString:@"code"]) {
        _code = 0;
    } else {
        [super setNilValueForKey:key];
    }
}

@end

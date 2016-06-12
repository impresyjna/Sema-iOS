//
//  SEAccount.m
//  Sema
//
//  Created by Joanna Furmaniak on 07.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEAccount.h"

@implementation SEAccount

@dynamic user;

- (instancetype)init {
    self = [super init];
    if(self) {
       self.accountName = @"Sema";
       self.serviceName = @"Sema-service";
    }
    return self;
}

- (BOOL)isLoggedIn {
    return self.user != nil;
}

@end

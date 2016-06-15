//
//  SEAddRoomParams.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEAddRoomParams.h"

@implementation SEAddRoomParams

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if(self) {
        _name = name;
    }
    return self; 
}

- (NSDictionary *)params {
    return @{
             @"room": @{
                     @"name": _name
                     }
             };
}
@end

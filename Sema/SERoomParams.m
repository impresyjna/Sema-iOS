//
//  SERoomParams.m
//  Sema
//
//  Created by Joanna Furmaniak on 14.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERoomParams.h"

@implementation SERoomParams

- (instancetype)initWithRoomId:(NSInteger)roomId {
    self = [super init];
    if(self) {
        _roomId = roomId;
    }
    return self;
}

- (NSDictionary *)params {
    return @{
             @"room": @{
                     @"id": @(_roomId)
                     }
             };
}

@end

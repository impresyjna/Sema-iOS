//
//  SEGameCardParams.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEGameCardParams.h"

@implementation SEGameCardParams

- (instancetype)initWithCardId:(NSInteger)cId roomUserId:(NSNumber *)roomUserId questionId:(NSNumber *)questionId ready:(NSNumber *)ready roomId:(NSNumber *)roomId {
    self = [super init];
    if(self) {
        _cId = cId;
        _roomUserId = roomUserId;
        _roomId = roomId;
        _questionId = questionId;
        _ready = ready;
    }
    return self;
}

- (NSDictionary *)params {
    NSMutableDictionary *gameCardParams = [NSMutableDictionary new];
    [gameCardParams setObject:@(_cId) forKey:@"id"];
    [gameCardParams setObject:_ready forKey:@"ready"];
    [gameCardParams setObject:_roomId forKey:@"room_id"];
    if(_questionId!=0) {
        [gameCardParams setObject:_questionId forKey:@"question_number"];
    }
    if(_roomUserId!=0) {
        [gameCardParams setObject:_roomUserId forKey:@"room_user_id"];
    }
    
    return @{
             @"game_card": gameCardParams
             };
}

@end

//
//  SERequests.h
//  Sema
//
//  Created by Joanna Furmaniak on 02.05.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "SELoginUserParams.h"
#import "SERegisterUserParams.h"
#import "SENewQuestionParams.h"
#import "SEFriendParams.h"
#import "SERoomParams.h"

@interface AFHTTPSessionManager (SERequests)


- (NSMutableURLRequest *)requestLoginUserWithParams:(SELoginUserParams *)params;
- (NSMutableURLRequest *)requestRegisterUserWithParams:(SERegisterUserParams *)params;
- (NSMutableURLRequest *)requestLogoutCurrentUser;

- (NSMutableURLRequest *)requestUpdateUserWithParams:(SERegisterUserParams *)params;

- (NSMutableURLRequest *)requestAddNewQuestionWithParams:(SENewQuestionParams *)params;

- (NSMutableURLRequest *)requestFriendshipIndex;
- (NSMutableURLRequest *)requestAddFriendshipWithParams:(SEFriendParams *)params;

- (NSMutableURLRequest *)requestRoomIndex;
- (NSMutableURLRequest *)requestRoomUsersIndexWithParams:(SERoomParams *)params;
- (NSMutableURLRequest *)requestJoinRoomWithParams:(SERoomParams *)params;

- (NSMutableURLRequest *)requestGameCardsIndexWithParams:(SERoomParams *)params;


@end

//
//  SERequests.m
//  Sema
//
//  Created by Joanna Furmaniak on 02.05.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERequests.h"

#import "SEAccount.h"

@implementation  AFHTTPSessionManager (SERequests)

#pragma mark - 
#pragma mark - Sessions

- (NSMutableURLRequest *)requestLoginUserWithParams:(SELoginUserParams *)params {
    return [self.requestSerializer requestWithMethod:@"POST"
                                    URLString:[NSString stringWithFormat:@"%@/sessions/login",self.baseURL]
                                    parameters:[params params]
                                        error:nil];
}

- (NSMutableURLRequest *)requestRegisterUserWithParams:(SERegisterUserParams *)params {
    return [self.requestSerializer requestWithMethod:@"POST"
                                           URLString:[NSString stringWithFormat:@"%@/users", self.baseURL]
                                          parameters:[params params]
                                               error:nil]; 
}

- (NSMutableURLRequest *)requestLogoutCurrentUser {
    return [self.requestSerializer requestWithMethod:@"DELETE"
                                           URLString:[NSString stringWithFormat:@"%@/sessions/logout",self.baseURL]
                                          parameters:nil
                                               error:nil];
}

- (NSMutableURLRequest *)requestUpdateUserWithParams:(SERegisterUserParams *)params {
    return [self.requestSerializer requestWithMethod:@"PUT"
                                           URLString:[NSString stringWithFormat:@"%@/users/%d",self.baseURL, [SEAccount account].user.uId]
                                          parameters:[params params]
                                               error:nil];
}

- (NSMutableURLRequest *)requestAddNewQuestionWithParams:(SENewQuestionParams *)params {
    return [self.requestSerializer requestWithMethod:@"POST"
                                           URLString:[NSString stringWithFormat:@"%@/questions", self.baseURL]
                                           parameters:[params params]
                                               error:nil]; 
}

#pragma mark -
#pragma mark - Users



@end

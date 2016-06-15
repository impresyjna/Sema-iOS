//
//  SEGameCardParams.h
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SERequestParamsProtocol.h"

@interface SEGameCardParams : NSObject <SERequestParamsProtocol>

@property (nonatomic, assign, readonly) NSInteger cId;
@property (nonatomic, strong, readonly) NSNumber *roomUserId;
@property (nonatomic, strong, readonly) NSNumber *questionId;
@property (nonatomic, strong, readonly) NSNumber *ready;
@property (nonatomic, strong, readonly) NSNumber *roomId;

- (instancetype)initWithCardId:(NSInteger)cId roomUserId:(NSNumber *)roomUserId questionId:(NSNumber *)questionId ready:(NSNumber *)ready roomId:(NSNumber *)roomId;

@end

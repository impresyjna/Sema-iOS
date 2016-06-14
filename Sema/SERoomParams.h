//
//  SERoomParams.h
//  Sema
//
//  Created by Joanna Furmaniak on 14.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SERequestParamsProtocol.h"

@interface SERoomParams : NSObject <SERequestParamsProtocol>

@property (nonatomic, assign, readonly) NSInteger roomId;

- (instancetype) initWithRoomId:(NSInteger)roomId;

@end

//
//  SEAddRoomParams.h
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SERequestParamsProtocol.h"

@interface SEAddRoomParams : NSObject <SERequestParamsProtocol>

@property(nonatomic, strong, readonly) NSString *name;

-(instancetype) initWithName:(NSString *)name;

@end

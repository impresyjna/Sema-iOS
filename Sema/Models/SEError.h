//
//  SEError.h
//  Sema
//
//  Created by Joanna Furmaniak on 13.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface SEError : MTLModel <MTLJSONSerializing>

@property (nonatomic, readonly, assign) NSInteger code;
@property (nonatomic, readonly, strong) NSDictionary *messages;

- (NSError *)error;

@end

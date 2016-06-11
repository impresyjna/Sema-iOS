//
//  SEQuestion.h
//  Sema
//
//  Created by Joanna Furmaniak on 11.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface SEQuestion : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign, readonly) NSInteger qID;
@property (nonatomic, assign, readonly) NSString *conent; 

@end

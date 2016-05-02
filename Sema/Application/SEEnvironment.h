//
//  SEEnvironment.h
//  Sema
//
//  Created by Joanna Furmaniak on 02.05.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEConstants.h"

@interface SEEnvironment : NSObject

+ (SEEnvironment *)sharedConfiguration;

- (NSURL *)apiBaseURL;

- (id)variableForKey:(NSString *)key; 
@end

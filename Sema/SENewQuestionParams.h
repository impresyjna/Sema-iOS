//
//  SENewQuestionParams.h
//  Sema
//
//  Created by Joanna Furmaniak on 11.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SERequestParamsProtocol.h"

@interface SENewQuestionParams : NSObject <SERequestParamsProtocol>

@property(nonatomic, strong, readonly) NSString *content;

-(instancetype) initWithContent:(NSString *)content; 

@end

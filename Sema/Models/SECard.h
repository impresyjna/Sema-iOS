//
//  SECard.h
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "SEQuestionInCard.h"

@interface SECard : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong, readonly) NSArray <SEQuestionInCard *> *questions;

@end

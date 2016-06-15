//
//  SEQuestionInCard.h
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface SEQuestionInCard : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong, readonly) NSNumber *cardNumber;
@property (nonatomic, strong, readonly) NSString *questionContent;

@end

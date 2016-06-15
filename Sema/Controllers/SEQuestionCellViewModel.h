//
//  SEQuestionCellViewModel.h
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEQuestionInCard.h"

@interface SEQuestionCellViewModel : NSObject

@property (nonatomic, strong, readonly) NSNumber *cardNumber;
@property (nonatomic, strong, readonly) NSString *questionContent;

- (instancetype)initWithQuestionInCard:(SEQuestionInCard *)questionInCard;

@end

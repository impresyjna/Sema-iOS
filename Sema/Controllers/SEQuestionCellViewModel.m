//
//  SEQuestionCellViewModel.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEQuestionCellViewModel.h"

@implementation SEQuestionCellViewModel

- (instancetype)initWithQuestionInCard:(SEQuestionInCard *)questionInCard {
    self = [super init];
    if(self) {
        _cardNumber = questionInCard.cardNumber;
        _questionContent = questionInCard.questionContent;
    }
    return self;
}

@end

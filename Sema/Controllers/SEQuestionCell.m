//
//  SEQuestionCell.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEQuestionCell.h"

@interface SEQuestionCell()

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionContentLabel;


@end

@implementation SEQuestionCell

+ (CGFloat)height {
    return 72.0f;
}

- (void)populateWithViewModel:(SEQuestionCellViewModel *)viewModel {
    self.numberLabel.text = [viewModel.cardNumber stringValue];
    self.questionContentLabel.text = viewModel.questionContent;
}

@end
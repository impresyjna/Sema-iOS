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
    return 40.0f;
}

- (void)populateWithViewModel:(SEQuestionCellViewModel *)viewModel colorMode:(NSInteger)colorable {
    self.numberLabel.text = [viewModel.cardNumber stringValue];
    self.questionContentLabel.text = viewModel.questionContent;
    if(colorable==1){
        self.numberLabel.textColor = [UIColor magentaColor];
        self.questionContentLabel.textColor = [UIColor magentaColor];
    }
}

@end

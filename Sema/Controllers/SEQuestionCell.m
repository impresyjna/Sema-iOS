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
        self.numberLabel.textColor = [UIColor colorWithRed:0.09 green:0.63 blue:0.52 alpha:1.0];
        self.questionContentLabel.textColor = [UIColor colorWithRed:0.09 green:0.63 blue:0.52 alpha:1.0];
    }
}

@end

//
//  SEQuestionCell.h
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SETableViewCell.h"
#import "SEQuestionCellViewModel.h"

@interface SEQuestionCell : SETableViewCell

+ (CGFloat)height;

- (void)populateWithViewModel:(SEQuestionCellViewModel *)viewModel colorMode:(NSInteger)colorable;

@end

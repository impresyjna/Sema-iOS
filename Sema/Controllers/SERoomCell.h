//
//  SERoomCell.h
//  Sema
//
//  Created by Joanna Furmaniak on 14.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SETableViewCell.h"
#import "SERoomCellViewModel.h"

@interface SERoomCell : SETableViewCell

+ (CGFloat)height;

- (void)populateWithViewModel:(SERoomCellViewModel *)viewModel;

@end

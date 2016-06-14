//
//  SERoomUserCell.h
//  Sema
//
//  Created by Joanna Furmaniak on 14.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SETableViewCell.h"
#import "SERoomUserCellViewModel.h"

@interface SERoomUserCell : SETableViewCell

+ (CGFloat)height;

- (void)populateWithViewModel:(SERoomUserCellViewModel *)viewModel;

@end

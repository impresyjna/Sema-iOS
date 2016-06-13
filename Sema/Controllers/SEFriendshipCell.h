//
//  SEFriendshipCell.h
//  Sema
//
//  Created by Joanna Furmaniak on 13.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SETableViewCell.h"
#import "SEFriendshipCellViewModel.h"

@interface SEFriendshipCell : SETableViewCell

+ (CGFloat)height;

- (void)populateWithViewModel:(SEFriendshipCellViewModel *)viewModel;

@end

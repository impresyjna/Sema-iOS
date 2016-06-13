//
//  SEFriendshipCell.m
//  Sema
//
//  Created by Joanna Furmaniak on 13.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEFriendshipCell.h"
//Category
#import "UIImageView+AFNetworking.h"

@interface SEFriendshipCell ()

@property (weak, nonatomic) IBOutlet UILabel *loginLabel;

@end

@implementation SEFriendshipCell

+ (CGFloat)height {
    return 76.0f;
}

- (void)populateWithViewModel:(SEFriendshipCellViewModel *)viewModel {
    
    self.loginLabel.text = viewModel.login;
}

@end

//
//  SERoomCell.m
//  Sema
//
//  Created by Joanna Furmaniak on 14.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERoomCell.h"
//Category
#import "UIImageView+AFNetworking.h"

@interface SERoomCell()

@property (weak, nonatomic) IBOutlet UILabel *roomNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *usersInRoomLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryNameLabel;

@end

@implementation SERoomCell

+ (CGFloat)height {
    return 140.0f;
}

- (void)populateWithViewModel:(SERoomCellViewModel *)viewModel {
    
    self.roomNameLabel.text = viewModel.roomName;
    self.usersInRoomLabel.text = [viewModel.usersCount stringValue];
    self.categoryNameLabel.text = viewModel.categoryName;
}

@end

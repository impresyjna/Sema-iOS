//
//  SERoomUserCell.m
//  Sema
//
//  Created by Joanna Furmaniak on 14.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SERoomUserCell.h"

@interface SERoomUserCell()

@property (weak, nonatomic) IBOutlet UILabel *loginLabel;

@end

@implementation SERoomUserCell

+ (CGFloat)height {
    return 72.0f;
}

-(void)populateWithViewModel:(SERoomUserCellViewModel *)viewModel {
    
    self.loginLabel.text = viewModel.userLogin;
}

@end

//
//  SETableViewCell.m
//  Sema
//
//  Created by Joanna Furmaniak on 13.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SETableViewCell.h"

@implementation SETableViewCell

+ (NSString *)reuseIdentifier {
    return NSStringFromClass(self.class);
}

+ (UINib *)nib {
    return [UINib nibWithNibName:[self reuseIdentifier] bundle:nil];
}

@end

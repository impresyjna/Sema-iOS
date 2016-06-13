//
//  SETableViewCell.h
//  Sema
//
//  Created by Joanna Furmaniak on 13.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SETableViewCell : UITableViewCell

+ (NSString *)reuseIdentifier;
+ (UINib *)nib;

@end

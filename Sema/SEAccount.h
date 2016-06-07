//
//  SEAccount.h
//  Sema
//
//  Created by Joanna Furmaniak on 07.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <AUAccount/AUAccount.h>
#import "SEUser.h"

@interface SEAccount : AUAccount

@property (nonatomic, strong, readonly) SEUser *user;

@end

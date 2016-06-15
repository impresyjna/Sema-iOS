//
//  SEGameMenuViewModel.h
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SERoom.h"

@interface SEGameMenuViewModel : NSObject

@property (nonatomic, strong, readonly) SERoom *room;

- (instancetype)initWithRoom:(SERoom *)room; 

@end

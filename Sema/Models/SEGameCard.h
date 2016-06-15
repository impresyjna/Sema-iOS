//
//  SEGameCard.h
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "SECard.h"

@interface SEGameCard : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign, readonly) NSInteger cId;
@property (nonatomic, strong, readonly) NSString *senderLogin;
@property (nonatomic, strong, readonly) NSNumber *questionNumber;
@property (nonatomic, strong, readonly) SECard *card;

@end

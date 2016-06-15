//
//  SEGameCardSerializer.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEGameCardSerializer.h"

@implementation SEGameCardSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error {
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    SEGameCard *gameCard = [MTLJSONAdapter modelOfClass:SEGameCard.class fromJSONDictionary:json[@"game_card"] error:nil];
    
    NSMutableDictionary *results = [[NSMutableDictionary alloc] init];
    
    if (gameCard) {
        [results setValue:gameCard forKey:@"game_card"];
    }
    
    return results;
}

@end

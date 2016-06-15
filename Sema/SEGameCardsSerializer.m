//
//  SEGameCardsSerializer.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEGameCardsSerializer.h"

@implementation SEGameCardsSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error {
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    NSArray *gameCards = @[];
    if(json[@"game_cards"] != nil) {
        gameCards = [MTLJSONAdapter modelsOfClass:SEGameCard.class fromJSONArray:json[@"game_cards"] error:nil];
    }
    NSMutableDictionary *results = [[NSMutableDictionary alloc] init];
    
    if (gameCards) {
        [results setValue:gameCards forKey:@"game_cards"];
    }
    
    return results;
}

@end

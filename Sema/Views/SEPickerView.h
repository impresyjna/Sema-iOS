//
//  SEPickerView.h
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SEPickerItemProtocol <NSObject>

- (NSString *)itemTitle;

@end

typedef void(^SEPickerViewPickingCompletion)(id<SEPickerItemProtocol> item);

@interface SEPickerView : UIPickerView <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, copy) SEPickerViewPickingCompletion pickItemBlock;

- (instancetype)initWithItems:(NSArray <id<SEPickerItemProtocol>> *)items;

@end

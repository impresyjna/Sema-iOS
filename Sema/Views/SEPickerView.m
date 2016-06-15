//
//  SEPickerView.m
//  Sema
//
//  Created by Joanna Furmaniak on 15.06.2016.
//  Copyright © 2016 The Company. All rights reserved.
//

#import "SEPickerView.h"

@interface SEPickerView ()
@property (nonatomic, strong) NSArray <id<SEPickerItemProtocol>> *items;
@end

@implementation SEPickerView

- (instancetype)initWithItems:(NSArray<id<SEPickerItemProtocol>> *)items {
    self = [super init];
    if (self) {
        _items = items;
        
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

#pragma mark -
#pragma mark - UIPickerViewDelegate

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return (NSInteger)self.items.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    return [self.items[(NSUInteger)row] itemTitle];
}

#pragma mark -
#pragma mark - UIPickerViewDataSource

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (self.pickItemBlock) {
        self.pickItemBlock(self.items[(NSUInteger)row]);
    };
}

@end

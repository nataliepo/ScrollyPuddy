//
//  InputAccessoryView.m
//  ScrollyPuddy
//
//  Created by nataliepo on 11/23/15.
//  Copyright © 2015. All rights reserved.
//

#import "InputAccessoryView.h"

@interface InputAccessoryView ()

@property (nonatomic) UITextField *textView;

@end

@implementation InputAccessoryView

- (instancetype) init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        
        self.textView = [UITextField new];
        self.textView.font = [UIFont systemFontOfSize:14];
        self.textView.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
        [self addSubview:self.textView];

    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    self.textView.frame = (CGRect){10, 10, rect.size.width - 20, rect.size.height - 20};
}

@end

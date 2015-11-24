//
//  ViewController.m
//  ScrollyPuddy
//
//  Created by nataliepo on 11/23/15.
//  Copyright © 2015. All rights reserved.
//

#import "ViewController.h"
#import "TableView.h"
#import "InputAccessoryView.h"


@interface ViewController () <TableTapDelegate>

@property (nonatomic) TableView *tableView;
@property (nonatomic) InputAccessoryView *accessoryView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
        
    self.tableView = [[TableView alloc] initWithFrame:(CGRect){CGPointZero, self.view.bounds.size.width, self.view.bounds.size.height - 50}];
    [self.tableView reloadData];
    self.tableView.tableTapDelegate = self;
    [self.view addSubview:self.tableView];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)handleTap {
    [self becomeFirstResponder];
}

- (UIView *)inputAccessoryView {
    if (!_accessoryView) {
        _accessoryView = [InputAccessoryView new];
        _accessoryView.backgroundColor = [[UIColor purpleColor] colorWithAlphaComponent:1];
        _accessoryView.frame = (CGRect){CGPointZero, self.view.bounds.size.width, 50};
    }
    return _accessoryView;
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)tableView:(TableView *)tableView didTapCell:(NSIndexPath *)row {
    [self resignFirstResponder];
}

@end

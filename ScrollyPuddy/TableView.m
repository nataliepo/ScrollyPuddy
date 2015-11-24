//
//  TableView.m
//  ScrollyPuddy
//
//  Created by nataliepo on 11/23/15.
//  Copyright © 2015. All rights reserved.
//

#import "TableView.h"

@interface TableView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) NSMutableArray *data;

@end

@implementation TableView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame style:UITableViewStylePlain];
    
    if (self) {
        self.data = [TableView sampleDataset];
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

+ (NSMutableArray *)sampleDataset {
    NSMutableArray *dataset = @[].mutableCopy;
    for (int i = 0; i < 200; i++) {
        [dataset addObject:[NSString stringWithFormat:@"Row #%d", (i + 1)]];
    }
    return dataset;
}


#pragma mark - <UITableViewDatasource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section  {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }

    cell.textLabel.text = self.data[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (indexPath.row % 2 == 0) ? 50 : 75;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableTapDelegate tableView:self didTapCell:indexPath];
}

#pragma mark - <UITableViewDelegate>

@end

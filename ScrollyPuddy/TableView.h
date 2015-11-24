//
//  TableView.h
//  ScrollyPuddy
//
//  Created by nataliepo on 11/23/15.
//  Copyright © 2015. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TableView;
@protocol TableTapDelegate <NSObject>

- (void)tableView:(TableView *)tableView didTapCell:(NSIndexPath *)row;

@end

@interface TableView : UITableView

@property (nonatomic, weak) id<TableTapDelegate> tableTapDelegate;

@end

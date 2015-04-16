//
//  TableViewController.h
//  Prabal TableView Test
//
//  Created by Harsh Sapra on 06/04/15.
//  Copyright (c) 2015 Harsh Sapra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic) int numberOfBeacons;
@property (nonatomic) int selectedCellIndex;
@property (strong, nonatomic) NSMutableArray *beacons;
@end

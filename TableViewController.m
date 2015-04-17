//
//  TableViewController.m
//  Prabal TableView Test
//
//  Created by Harsh Sapra on 06/04/15.
//  Copyright (c) 2015 Harsh Sapra. All rights reserved.
//

#import "TableViewController.h"
#import "SelectedCellViewController.h"
#import "AddItemViewController.h"
#import "Beacon.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.beacons = [[NSMutableArray alloc] init];
    
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"%@", self.beacons);
    [self.tableView reloadData];
}

- (NSMutableArray *)beacons {
    if(!_beacons) {
        _beacons = [[NSMutableArray alloc] init];
    }
    return _beacons;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.beacons count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSMutableDictionary *beacon = [self.beacons objectAtIndex:indexPath.row];
    cell.textLabel.text = [beacon objectForKey:BEACON_NAME];
    cell.imageView.image = [beacon objectForKey:BEACON_IMAGE];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

//In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//     Get the new view controller using [segue destinationViewController].
//     Pass the selected object to the new view controller.
    if([[segue destinationViewController] isKindOfClass:[SelectedCellViewController class]]){
        SelectedCellViewController *selectedCellViewController = [segue destinationViewController];
        selectedCellViewController.selectedBeacon = [self.beacons objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        //NSLog(@"Selected cell index: %d", [self.tableView indexPathForSelectedRow].row);
    }
    
    if([[segue destinationViewController] isKindOfClass:[AddItemViewController class]]) {
        AddItemViewController *addItemViewController = [segue destinationViewController];
        addItemViewController.beacons = self.beacons;
    }
}


@end

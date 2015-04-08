//
//  AddItemViewController.h
//  Prabal TableView Test
//
//  Created by Harsh Sapra on 06/04/15.
//  Copyright (c) 2015 Harsh Sapra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddItemViewController : UIViewController

//Outlets
@property (strong, nonatomic) IBOutlet UITextField *beaconName;
@property (strong, nonatomic) IBOutlet UITextField *beaconUUID;
@property (strong, nonatomic) IBOutlet UITextField *beaconMajorValue;
@property (strong, nonatomic) IBOutlet UITextField *beaconMinorValue;
@property (strong, nonatomic) IBOutlet UITextField *beaconURL;

//Actions
- (IBAction)saveButtonClicked:(UIButton *)sender;

@end

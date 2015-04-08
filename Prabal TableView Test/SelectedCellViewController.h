//
//  SelectedCellViewController.h
//  Prabal TableView Test
//
//  Created by Harsh Sapra on 07/04/15.
//  Copyright (c) 2015 Harsh Sapra. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreLocation;

@interface SelectedCellViewController : UIViewController

//IBOutlet
@property (strong, nonatomic) IBOutlet UILabel *beaconProximity;
@property (strong, nonatomic) IBOutlet UILabel *beaconName;
@property (strong, nonatomic) IBOutlet UILabel *beaconUUID;
@property (strong, nonatomic) IBOutlet UILabel *beaconMajor;
@property (strong, nonatomic) IBOutlet UILabel *beaconMinor;
@property (strong, nonatomic) IBOutlet UILabel *beaconURL;

//Properties
@property (nonatomic) int selectedCellIndex;
@property (strong, nonatomic) NSMutableDictionary *selectedBeacon;
@property (strong, nonatomic) CLLocationManager *locationManager;
@end

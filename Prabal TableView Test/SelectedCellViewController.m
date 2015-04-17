//
//  SelectedCellViewController.m
//  Prabal TableView Test
//
//  Created by Harsh Sapra on 07/04/15.
//  Copyright (c) 2015 Harsh Sapra. All rights reserved.
//

#import "SelectedCellViewController.h"
#import "Beacon.h"

@interface SelectedCellViewController () <CLLocationManagerDelegate>

@end

@implementation SelectedCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawCircleViewForProximity:@""];
    // Do any additional setup after loading the view.
    
    self.beaconName.text = [self.selectedBeacon objectForKey:BEACON_NAME];
    self.beaconUUID.text = [self.selectedBeacon objectForKey:BEACON_UUID];
    self.beaconMajor.text = [self.selectedBeacon objectForKey:BEACON_MAJOR];
    self.beaconMinor.text = [self.selectedBeacon objectForKey:BEACON_MINOR];
    self.beaconURL.text = [self.selectedBeacon objectForKey:BEACON_URL];
    
//    self.beaconName.text = @"b1";
//    self.beaconUUID.text = @"8AEFB031-6C32-486F-825B-E26FA193487D";
//    self.beaconMajor.text = @"1";
//    self.beaconMinor.text = @"2";
//    self.beaconURL.text = @"http://www.google.com";
    
    NSUUID *beaconUUID = [[NSUUID alloc] initWithUUIDString:self.beaconUUID.text];
    
    self.region = [[CLBeaconRegion alloc] initWithProximityUUID:beaconUUID
                                                                identifier:self.beaconName.text];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestAlwaysAuthorization];
    }
    [self.locationManager startRangingBeaconsInRegion:self.region];
    [self.locationManager startMonitoringForRegion:self.region];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Location Manager Delegate

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region {
    if(beacons.count > 0) {
        NSLog(@"%@", beacons);
        CLBeacon *beacon = beacons[0];
        self.beaconProximity.text = [self nameForProximity:beacon.proximity];
        [self drawCircleViewForProximity:[self nameForProximity:beacon.proximity]];
    }
}

#pragma mark - helper methods
- (NSString*)nameForProximity:(CLProximity)proximity {
    switch (proximity) {
        case CLProximityUnknown:
            return @"Unknown";
            break;
            
        case CLProximityFar:
            return @"Far";
            break;
            
        case CLProximityImmediate:
            return @"Immediate";
            break;
            
        case CLProximityNear:
            return @"Near";
            break;
            
        default:
            return @"error";
            break;
    }
}

- (void)drawCircleViewForProximity:(NSString *)proximity {
    UIColor *circleColor;
    
    if([proximity  isEqual: @"Unknown"]) {
        circleColor = [UIColor blackColor];
    }
    else if([proximity  isEqual: @"Far"]) {
        circleColor = [UIColor redColor];
    }
    else if([proximity  isEqual: @"Immediate"]) {
        circleColor = [UIColor greenColor];
    }
    else if([proximity  isEqual: @"Near"]) {
        circleColor = [UIColor yellowColor];
    }
    else {
        circleColor = [UIColor grayColor];
    }
    self.circleView.layer.cornerRadius = 50;
    self.circleView.backgroundColor = circleColor;
}

@end

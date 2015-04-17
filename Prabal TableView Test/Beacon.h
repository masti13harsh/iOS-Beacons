//
//  Beacon.h
//  Prabal TableView Test
//
//  Created by Harsh Sapra on 17/04/15.
//  Copyright (c) 2015 Harsh Sapra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Beacon : NSObject

#define BEACON_NAME @"Beacon Name"
#define BEACON_UUID @"Beacon UUID"
#define BEACON_MAJOR @"Beacon Major"
#define BEACON_MINOR @"Beacon Minor"
#define BEACON_URL @"Beacon URL"
#define BEACON_IMAGE @"Beacon Image"

@property (strong, nonatomic) NSMutableDictionary *beaconDictionary;

- (NSDictionary *)insertBeaconInDictionaryAndReturn:(NSString *)name withUUID:(NSString *)UUID withMajor:(NSString *)major withMonor:(NSString *)minor withURL:(NSString *)URL andImage:(UIImage *)image;

@end

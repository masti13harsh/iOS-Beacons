//
//  Beacon.m
//  Prabal TableView Test
//
//  Created by Harsh Sapra on 17/04/15.
//  Copyright (c) 2015 Harsh Sapra. All rights reserved.
//

#import "Beacon.h"

@implementation Beacon

- (NSDictionary *)insertBeaconInDictionaryAndReturn:(NSString *)name withUUID:(NSString *)UUID withMajor:(NSString *)major withMonor:(NSString *)minor withURL:(NSString *)URL andImage:(UIImage *)image {
    
    NSDictionary *beacon = @{BEACON_NAME:name, BEACON_UUID:UUID, BEACON_MAJOR:major, BEACON_MINOR:minor, BEACON_URL:URL, BEACON_IMAGE:image};
    
    return beacon;
}

@end

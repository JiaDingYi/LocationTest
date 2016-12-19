//
//  LocationManger.m
//  LocationTest
//
//  Created by 甲丁乙_ on 2016/10/16.
//  Copyright © 2016年 甲丁乙_. All rights reserved.
//

#import "LocationManger.h"

@implementation LocationManger{
    CLLocationManager *locationManger;
    locationBlock Returnblock;
}

+(LocationManger *)shareLocationInforModel{
    static LocationManger *manger = nil;
    if (!manger) {
        static dispatch_once_t once_token;
        dispatch_once(&once_token,^{
            manger = [[LocationManger alloc]init];
        });
    }
    return manger;
}

-(void)getUserCurrentLocationInfoWith:(locationBlock)block{
    Returnblock = block;
    if (!locationManger) {
        locationManger = [[CLLocationManager alloc]init];
        locationManger.delegate = self;
        locationManger.distanceFilter = kCLDistanceFilterNone;
        locationManger.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    }
    [locationManger requestWhenInUseAuthorization];
    if (locationManger){
        [locationManger startUpdatingLocation];
}
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    CLLocation *currentLocation = [locations lastObject];
    self.uLatitude = currentLocation.coordinate.latitude;
    self.uLongitude = currentLocation.coordinate.longitude;
   
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:currentLocation
                   completionHandler:^(NSArray *array, NSError *error) {
                       if (array.count > 0) {
                           if (Returnblock)
                               Returnblock(success, self);
                       } else if (error == nil && [array count] == 0) {
                           if (Returnblock)
                               Returnblock(failure,self);
                       } else if (error != nil) {
                           if (Returnblock)
                               Returnblock(failure,self);
                       }
                   }];
    [locationManger stopUpdatingLocation];
    
}


@end

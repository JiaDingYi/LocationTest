//
//  LocationManger.h
//  LocationTest
//
//  Created by 甲丁乙_ on 2016/10/16.
//  Copyright © 2016年 甲丁乙_. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@class LocationManger;

typedef enum {
    failure,
    success
}locationResult;

typedef  void(^locationBlock)(locationResult result,LocationManger *manger);

@interface LocationManger : NSObject <CLLocationManagerDelegate>

@property (nonatomic,copy) locationBlock returnLocation;

/**
 *  @brief  用户当前的纬度
 */
@property (assign, nonatomic) CLLocationDegrees uLatitude;

/**
 *  @brief  用户当前的经度
 */
@property (assign, nonatomic) CLLocationDegrees uLongitude;

/**
 *  @brief  单例
 */
+ (LocationManger *)shareLocationInforModel;

/**
 *  @brief  定位（或重新定位）获取用户当前位置信息
 */
- (void)getUserCurrentLocationInfoWith:(locationBlock)block;



@end

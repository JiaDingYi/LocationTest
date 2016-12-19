//
//  ViewController.m
//  LocationTest
//
//  Created by 甲丁乙_ on 2016/10/16.
//  Copyright © 2016年 甲丁乙_. All rights reserved.
//

#import "ViewController.h"
#import "LocationManger.h"


@interface ViewController ()
@property (nonatomic,strong) LocationManger *manger;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.manger = [LocationManger shareLocationInforModel];
    [self.manger getUserCurrentLocationInfoWith:^ void(locationResult result, LocationManger *manger) {
        NSLog(@"%u,%f,%f",result,manger.uLongitude,manger.uLatitude);
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

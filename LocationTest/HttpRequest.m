//
//  HttpRequest.m
//  LocationTest
//
//  Created by 甲丁乙_ on 2016/10/16.
//  Copyright © 2016年 甲丁乙_. All rights reserved.
//

#import "HttpRequest.h"

@implementation HttpRequest

- (NSString *)sendRequestSyncWithURL:(NSString *)urlStr body:(NSData *)content
{
    // 初始化请求, 这里是变长的, 方便扩展
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    
    // 设置
    [request setURL:[NSURL URLWithString:urlStr]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:content];
    
    // 发送同步请求, data就是返回的数据
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    if (data == nil) {
        NSLog(@"send request failed: %@", error);
        return nil;
    }
    
    NSString *response = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"response: %@", response);
    return response;
}

@end

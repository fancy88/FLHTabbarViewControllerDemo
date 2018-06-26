//
//  HttpClient.h
//  BH
//
//  Created by Victor on 15/12/17.
//  Copyright © 2015年 南京毗邻智慧医疗科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^httpClientCallback)(NSDictionary  *result,NSError *error);

@interface HttpClient : NSObject

-(void)POST:(NSString *)urlStr  parameter:(NSDictionary *)parameters callBack:(httpClientCallback)block;

-(void)GET:(NSString *)urlStr  parameter:(NSDictionary *)parameters callBack:(httpClientCallback)block;

-(void)MULTI:(NSString *)urlStr parameters:(NSDictionary *)parameters  data:(NSData *)data callBack:(httpClientCallback)block ;

-(void)MULTIAUDIO:(NSString *)urlStr parameters:(NSDictionary *)parameters  data:(NSData *)data callBack:(httpClientCallback)block ;

@end

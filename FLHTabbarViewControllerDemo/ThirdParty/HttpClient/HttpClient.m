//
//  HttpClient.m
//  BH
//
//  Created by Victor on 15/12/17.
//  Copyright © 2015年 南京毗邻智慧医疗科技有限公司. All rights reserved.
//

#import "HttpClient.h"
#import "AFHTTPSessionManager.h"
@implementation HttpClient

-(void)GET:(NSString *)urlStr  parameter:(NSDictionary *)parameters callBack:(httpClientCallback)block{
    
    AFHTTPSessionManager *manager = [self getSessionManager];
   
    [manager GET:urlStr parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        block(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        block(nil,error);
        
    }];
    
}

-(void)POST:(NSString *)urlStr  parameter:(NSDictionary *)parameters callBack:(httpClientCallback)block{

    NSMutableDictionary *requestDic = [NSMutableDictionary dictionaryWithDictionary:parameters];
    
    [requestDic setObject:@"1.0" forKey:@"version"];
    [requestDic setObject:@"APP" forKey:@"source"];

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:nil delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    
 //   NSString *postString = [Utility jsonStringFromObj:requestDic];//[requestDic JSONString];
    NSString *postString = @" ";
    postString = [postString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    postString = [postString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSData *data = [postString dataUsingEncoding:NSUTF8StringEncoding];
    
    [request setHTTPBody:data];
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        NSDictionary *dic = [str objectFromJSONString];
        NSDictionary *dic = [NSDictionary dictionary];
        dispatch_async(dispatch_get_main_queue(), ^{
            // 更UI
            
            block(dic,nil);
        });
        
    }];
    [postDataTask resume];
}

-(void)MULTI:(NSString *)urlStr parameters:(NSDictionary *)parameters  data:(NSData *)data callBack:(httpClientCallback)block{
    urlStr = @"https://billionhealth.com:443/smart/filemobile/";
    AFHTTPSessionManager *manager = [self getSessionManager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json" ,
                                                         @"text/html",
                                                         @"text/xml",
                                                         @"json/text",
                                                         nil];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer multipartFormRequestWithMethod:@"POST"
                                                    URLString:urlStr
                                                   parameters:parameters
                                    constructingBodyWithBlock:^(id<AFMultipartFormData> formData){
                                    }
                                                        error:nil];
    
    
    
    [manager POST:urlStr parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:data name:@"data" fileName:@"1.png" mimeType:@"image/jpeg"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 成功后的处理
        NSData *data = responseObject;
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
     //   NSDictionary *dic = [str objectFromJSONString];
        NSDictionary *dic = [NSDictionary dictionary];
        NSLog(@"返回报文: %@", dic);
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 失败后的处理
        NSLog(@"Error: %@", error);
        block(nil,error);
    }];
    
}

-(void)MULTIAUDIO:(NSString *)urlStr parameters:(NSDictionary *)parameters  data:(NSData *)data callBack:(httpClientCallback)block {
    urlStr = @"https://billionhealth.com:443/smart/filemobile/";
    AFHTTPSessionManager *manager = [self getSessionManager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:
                                                         @"text/plain",
                                                         @"application/json" ,
                                                         @"text/html",
                                                         @"text/xml",
                                                         @"json/text",
                                                         nil];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer multipartFormRequestWithMethod:@"POST"
                                                    URLString:urlStr
                                                   parameters:parameters
                                    constructingBodyWithBlock:^(id<AFMultipartFormData> formData){
                                    }
                                                        error:nil];
    
    
    
    [manager POST:urlStr parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        [formData appendPartWithFileData:data name:@"data" fileName:@"1.wav" mimeType:@"application/octet-stream"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 成功后的处理
        NSData *data = responseObject;
        NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        // NSDictionary *dic = [str objectFromJSONString];
        NSDictionary *dic = [NSDictionary dictionary];
        NSLog(@"返回报文: %@", dic);
        block(dic,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 失败后的处理
        NSLog(@"Error: %@", error);
        block(nil,error);
    }];
    
}

-(AFHTTPSessionManager *)getSessionManager{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json" ,@"text/html",@"text/xml",@"json/text",nil];
    return manager;
    
}
@end

//
//  networktool.m
//  Canbee
//
//  Created by Kluth on 2019/11/6.
//  Copyright © 2019 yu_jing_shan. All rights reserved.
//

#import "networktool.h"

@implementation networktool
/*
 发送GET请求
 */
+(void)get:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObj))success failure:(void(^)(NSError *error))failure{
	//1.获得请求管理者
	AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
	
	//2.发送GET请求
	[mgr GET:url parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
		if(success){
			success(responseObject);
		}
	} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
		if(failure){
			failure(error);
		}
	}];
}
/*
 发送POST请求
 */
+(NSURLSessionDataTask *)post:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObj))success failure:(void(^)(NSError *error))failure{
	//1.获得请求管理者
	AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
	
	NSURLSessionDataTask *dataTask = [mgr POST:url parameters:params headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
		if(success){
			success(responseObject);
		}
	} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
		if(failure){
			failure(error);
		}
	}];
	
	return dataTask;
}
@end

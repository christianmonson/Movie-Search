//
//  MSNetworkController.m
//  Movie-Search
//
//  Created by Christian Monson on 3/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "MSNetworkController.h"
#import <AFNetworking.h>
#import "MovieController.h"

@interface MSNetworkController ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

static NSString * const baseURL = @"http://api.themoviedb.org/3";

@implementation MSNetworkController

+ (AFHTTPSessionManager *)api {
    static AFHTTPSessionManager *api = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        api = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:baseURL]];
        api.responseSerializer = [AFJSONResponseSerializer serializer];
        api.requestSerializer = [AFJSONRequestSerializer serializer];
        [api.responseSerializer setAcceptableContentTypes: [NSSet setWithObject:@"text/html"]];
        [api.responseSerializer setAcceptableContentTypes: [NSSet setWithObject:@"application/json"]];
    });
    
    return api;
}

@end

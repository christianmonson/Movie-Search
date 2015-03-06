//
//  MovieController.m
//  Movie-Search
//
//  Created by Joshua Howland on 6/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "MovieController.h"
#import <AFNetworking.h>
#import "MSNetworkController.h"
#import "APIKey.h"

@implementation MovieController

+ (MovieController *)sharedInstance {
    
    static MovieController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [MovieController new];
    });
    return sharedInstance;
    
}

- (void)retrieveMovieWithName:(NSString *)name completion:(void (^)(NSArray *))completion {
    NSString *path = @"search/movie";
    
    NSDictionary *dictionary = @{@"api_key": APIKeyString, @"query":name};
    
    [[MSNetworkController api] GET:path parameters:dictionary success:^(NSURLSessionDataTask *task, id responseObject) {
        
        self.resultMovies = [responseObject objectForKey:@"results"];
        completion(self.resultMovies);
    
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@", error);
        
        completion(nil);
    }];
}

- (void)retrieveMovieWithID:(NSString *)movieID completion:(void (^)(NSDictionary *))completion {
    NSString *path = [NSString stringWithFormat:@"movie/%@", movieID];
    NSDictionary *dictionary = @{@"api_key": APIKeyString};
    
    [[MSNetworkController api] GET:path parameters:dictionary success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dictionary = responseObject;
        completion(dictionary);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completion(nil);
    }];
}

@end

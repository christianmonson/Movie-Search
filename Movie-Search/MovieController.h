//
//  MovieController.h
//  Movie-Search
//
//  Created by Joshua Howland on 6/18/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieController : NSObject

+ (MovieController *)sharedInstance;

@property (nonatomic, strong) NSArray *resultMovies;

- (void)retrieveMovieWithParameters:(NSDictionary *)dictionary completion:(void (^)(NSArray *))completion;
- (void)retrieveMovieWithID:(NSString *)movieID andParameter:(NSDictionary *)dictionary completion:(void (^)(NSDictionary *))completion;
@end

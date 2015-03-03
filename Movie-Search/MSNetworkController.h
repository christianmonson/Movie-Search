//
//  MSNetworkController.h
//  Movie-Search
//
//  Created by Christian Monson on 3/3/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPSessionManager;

@interface MSNetworkController : NSObject

+ (AFHTTPSessionManager *)api;

@end

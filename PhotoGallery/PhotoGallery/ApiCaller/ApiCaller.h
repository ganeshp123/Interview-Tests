//
//  EventListApiCaller.h
//  CJM
//
//  Created by cdp on 7/8/15.
//  Copyright (c) 2015 TS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIRequester.h"
#import "AppDelegate.h"

@interface ApiCaller : NSObject

@property(strong,nonatomic) APIRequester *requesterGetGalleryPhotos;
@property ( strong , nonatomic) void(^completionBlock)(id) ;


#pragma mark - Public Methods
-(void)getAnimalsDetailsWithCompletionBlock:(void(^)(id))completionBlock forPostData:(NSMutableDictionary *)dictPostData;
@end;

//
//  Utils.h
//  PhotoGallery
//
//  Created by datta on 05/11/15.
//  Copyright © 2015 Cuelogic Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject
#pragma mark getting Main Thread..and background thread..
+(void)RunOnMainThread:(void (^)(void))block;
+(void)RunOnBackgroundThread:(void (^)(void))block;
@end

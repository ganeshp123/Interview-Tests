//
//  EventListApiCaller.m
//  CJM
//
//  Created by cdp on 7/8/15.
//  Copyright (c) 2015 TS. All rights reserved.
//

#import "ApiCaller.h"

@implementation ApiCaller



#define TIMEOUT_VALUE 60

#pragma mark - Public Methods
-(void)getAnimalsDetailsWithCompletionBlock:(void(^)(id))completionBlock forPostData:(NSMutableDictionary *)dictPostData
{
    _requesterGetGalleryPhotos = [[APIRequester alloc]init];
    _completionBlock=completionBlock;
    [_requesterGetGalleryPhotos startWithDelegate:self withPostParameters:nil httpMethod:kTagHttpMethodGet withURL:URL_GET_PHOTOS withTimeOutValue:TIMEOUT_VALUE withImageData:nil withCompletionBlock:nil withRequestSeriealizer:kRequestSerializerHTTP];
    
}


#pragma mark - API Response Delegates
-(void)onOffline:(id)requesterObj
{
    
}
-(void)onFailure:(NSError *)errorObj ApiRequester:(id)requesterObj withStatusCode:(NSInteger)statusCode
{

}
-(void)onTimedOut:(id)requesterObj
{

    _completionBlock([NSError new]);
}

-(void)onSuccess:(NSData *)dataResponse ApiRequester:(id)requesterObj
{
    if(requesterObj==_requesterGetGalleryPhotos && dataResponse!=nil)
    {
        //Now Parse the animals data
        _completionBlock(dataResponse);
    }
}




@end

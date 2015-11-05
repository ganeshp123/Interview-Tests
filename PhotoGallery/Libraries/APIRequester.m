
//
//  APIRequester.m
//  CJM
//
//  Created by cdp on 5/14/15.
//  Copyright (c) 2015 TS. All rights reserved.
//

#import "APIRequester.h"


@implementation APIRequester


#pragma mark - Public Method
-(void)startWithDelegate:(id)delegate withPostParameters:(id)dictParameters httpMethod:(kTagHttpMethod)httpRequestMethod withURL:(NSString *)strUrl withTimeOutValue:(NSInteger )timeOutValue withImageData:(NSData *)dataImage  withCompletionBlock:(void(^)(id))compledtionBlock withRequestSeriealizer:(kRequestSerializer)requestSerializer
{
    _delResponseListner=delegate;
    _dictPost=dictParameters;
    
    /* Setting Up Request operation manager  */
    _requestManager=[AFHTTPRequestOperationManager manager];
    _requestManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    if (requestSerializer==kRequestSerializerJson)
    {
        _requestManager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    
    _requestManager.requestSerializer.timeoutInterval=timeOutValue;
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
        
        /* Check the internet right here and return the code .*/
        if (![AFNetworkReachabilityManager sharedManager].reachable)
        {
            if (self.delResponseListner)
            {
                [self.delResponseListner onOffline:self];
                return; /* Now  Don't move a-head  ....*/
            }
        }
    }];
    

    
    /* Start my own timer */
   _timer = [NSTimer scheduledTimerWithTimeInterval:timeOutValue target:self selector:@selector(timedOut:) userInfo:nil repeats:NO];
    switch (httpRequestMethod)
    {
        case kTagHttpMethodGet:
        {
            NSString *strUrlFull=[NSString stringWithFormat:@"%@%@",URL_HOST,strUrl];
            [_requestManager GET:strUrlFull parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                if (self.delResponseListner && _isTimedOut==NO)
                {
                    [self.delResponseListner onSuccess:responseObject ApiRequester:self];
                    [_timer invalidate];
                    return ;
                }
                /*  Now execute Completion Block  */
                compledtionBlock(responseObject);
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                
                if (self.delResponseListner && _isTimedOut==NO)
                {
                    [self.delResponseListner onFailure:error ApiRequester:self withStatusCode:operation.response.statusCode];
                    [_timer invalidate];
                    return ;
                }
                
                if(compledtionBlock)
                {
                    /*  Now execute Completion Block  */
                    compledtionBlock(error);
                }
                
                
            }];
        }
            break;
            
        case kTagHttpMethodPost:
        {
            
            NSString *strUrlFull=[NSString stringWithFormat:@"%@%@",URL_HOST,strUrl];
            
            [_requestManager POST:strUrlFull parameters:_dictPost
             
                success:^(AFHTTPRequestOperation *operation, id responseObject)
             {
                 
                 if (self.delResponseListner && _isTimedOut==NO)
                 {
                     [self.delResponseListner onSuccess:responseObject ApiRequester:self];
                     [_timer invalidate];
                     return ;
                 }
                 /*  Now execute Completion Block  */
                 if (compledtionBlock) {
                     compledtionBlock(responseObject);
                 }
                 
                 
             } failure:^(AFHTTPRequestOperation *operation, NSError *error)
             {
                 NSLog(@"Error: %@", error);
                 
                 if (self.delResponseListner && _isTimedOut==NO)
                 {
                     [self.delResponseListner onFailure:error ApiRequester:self withStatusCode:operation.response.statusCode];
                     [_timer invalidate];
                     return ;
                 }
                 
                 /*  Now execute Completion Block  */
                 if(compledtionBlock){
                     compledtionBlock(error);
                 }
                 
                 
             }];
        }
            break;

        case kTagHttpMultipart:
        {
            NSString *strUrlFull=[NSString stringWithFormat:@"%@%@",URL_HOST,strUrl];
            
            
            [_requestManager POST:strUrlFull parameters:_dictPost constructingBodyWithBlock:^(id<AFMultipartFormData> formData)
             {
                 if (dataImage)
                 {
                     //----Append user
                    // [formData appendPartWithFileData:dataImage name:KEY_PROFILE_PIC fileName:[NSString stringWithFormat:@"profile.jpg"] mimeType:@"image/jpeg"];
                 }
                 
             } success:^(AFHTTPRequestOperation *operation, id responseObject)
             {
                 
                 if (self.delResponseListner && _isTimedOut==NO)
                 {
                     [self.delResponseListner onSuccess:responseObject ApiRequester:self];
                     [_timer invalidate];
                 }
                 
             } failure:^(AFHTTPRequestOperation *operation, NSError *error)
             {
                 NSLog(@"Error: %@", error);
                 
                 if (self.delResponseListner && _isTimedOut==NO)
                 {
                     [self.delResponseListner onFailure:error ApiRequester:self withStatusCode:operation.response.statusCode];
                     [_timer invalidate];
                 }
                 
             }];
        }
            break;
            
        default:
            break;
    }
    
    
}

-(void)timedOut:(void(^)(void))completionBlock
{
    _isTimedOut=YES;
    
    if (self.delResponseListner && _isTimedOut)
    {
        [self.delResponseListner onTimedOut:self];
    }
}

@end

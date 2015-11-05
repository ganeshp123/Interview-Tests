//
//  Parser.m
//  PhotoGallery
//
//  Created by datta on 05/11/15.
//  Copyright © 2015 Cuelogic Technologies. All rights reserved.
//

#import "Parser.h"

@implementation Parser

#pragma mark - Public Methods
-(id)parseDataFrom:(NSData *)dataBytes
{
    NSMutableDictionary *dictResponseObj=[NSJSONSerialization JSONObjectWithData:dataBytes options:NSJSONReadingAllowFragments error:nil];
    
    //Pasing and replacing with model objects
    NSMutableDictionary *dictParsed = [[NSMutableDictionary alloc]init];
    for (NSString *strKey in dictResponseObj.allKeys)
    {
        [dictParsed setObject:[self getPhotoObject:[dictResponseObj objectForKey:strKey]] forKey:strKey];
    }
    
    
    
    
    
    
    
    return dictResponseObj;
}


-(ModelPhoto *)getPhotoObject:(NSMutableDictionary *)dictPhoto
{
    ModelPhoto *photoObj = [[ModelPhoto alloc]init];
    photoObj.strName = [dictPhoto objectForKey:KEY_NAME];
    photoObj.strUrl = [dictPhoto objectForKey:KEY_URL];
    
    return photoObj;
}


@end

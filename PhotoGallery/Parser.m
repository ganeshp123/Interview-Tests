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
    
    return dictResponseObj;
}
@end

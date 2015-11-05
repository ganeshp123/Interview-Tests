//
//  Parser.h
//  PhotoGallery
//
//  Created by datta on 05/11/15.
//  Copyright © 2015 Cuelogic Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Parser : NSObject

#pragma mark - Public Methods
-(id)parseDataFrom:(NSData *)dataBytes;
@end

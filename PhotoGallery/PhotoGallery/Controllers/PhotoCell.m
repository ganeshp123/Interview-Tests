//
//  ArticleCell.m
//  HorizontalTables
//
//  Created by Felipe Laso on 8/20/11.
//  Copyright 2011 Felipe Laso. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell
-(void)awakeFromNib
{
    [_imgViewPhoto.layer setMasksToBounds:YES];
    [_imgViewPhoto.layer setCornerRadius:5.0];
    [_imgViewPhoto setBackgroundColor:[UIColor lightGrayColor]];
}
@end

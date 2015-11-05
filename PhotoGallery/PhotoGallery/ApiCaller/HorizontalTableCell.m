//
//  HorizontalTableCell.m
//  HorizontalTables
//
//  Created by Felipe Laso on 8/19/11.
//  Copyright 2011 Felipe Laso. All rights reserved.
//

#import "HorizontalTableCell.h"
#import "PhotoCell.h"

@implementation HorizontalTableCell

#define IDENTIFIER_PHOTO_CELL @"PhotoCell"

#pragma mark - Public Methods
-(void)reloadGalleryPhotos
{
    [Utils RunOnMainThread:^{
        _colViewPhotos.delegate=self;
        _colViewPhotos.dataSource=self;
        [_colViewPhotos reloadData];
    }];
}


#pragma mark - UICollectionView DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _arrPhotoTypes.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:IDENTIFIER_PHOTO_CELL forIndexPath:indexPath];
    
    NSString *strUrl = [NSString stringWithFormat:@"%@%@",URL_HOST,[_arrPhotoTypes[indexPath.row] objectForKey:KEY_URL]];
    
    [cell.imgViewPhoto setImageWithURL:[NSURL URLWithString:strUrl] placeholderImage:nil usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *strUrl = [NSString stringWithFormat:@"%@%@",URL_HOST,[_arrPhotoTypes[indexPath.row] objectForKey:KEY_URL]];

    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc]initWithObjectsAndKeys:strUrl,KEY_URL, nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_DID_CLICK_IMAGE object:nil userInfo:userInfo];
    
}
@end

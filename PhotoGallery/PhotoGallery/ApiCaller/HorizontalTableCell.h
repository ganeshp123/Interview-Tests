//
//  HorizontalTableCell.h
//  HorizontalTables
//
//  Created by Felipe Laso on 8/19/11.
//  Copyright 2011 Felipe Laso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorizontalTableCell : UITableViewCell <UITableViewDelegate, UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblPhotoType;
@property (weak, nonatomic) IBOutlet UICollectionView *colViewPhotos;

@property (nonatomic, retain) NSArray *arrPhotoTypes;


#pragma mark - Public Methods
-(void)reloadGalleryPhotos;

@end

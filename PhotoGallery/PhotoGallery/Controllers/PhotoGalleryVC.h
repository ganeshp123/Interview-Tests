//
//  PhotoGalleryVC.h
//  PhotoGallery
//
//  Created by datta on 05/11/15.
//  Copyright © 2015 Cuelogic Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoGalleryVC : UIViewController
#pragma mark - IBOutlets
@property (weak, nonatomic) IBOutlet UIImageView *imgViewPhoto;

@property (weak, nonatomic) IBOutlet UITableView *tblViewPhotos;


@end

//
//  PhotoGalleryVC.m
//  PhotoGallery
//
//  Created by datta on 05/11/15.
//  Copyright © 2015 Cuelogic Technologies. All rights reserved.
//

#import "PhotoGalleryVC.h"
#import "ApiCaller.h"
#import "Parser.h"
#import "HorizontalTableCell.h"

@interface PhotoGalleryVC ()<UITableViewDataSource,UITableViewDelegate>
{
    ApiCaller *apiCallerGetAnimals;
    NSMutableDictionary *dictPhotosData;
}

@end

@implementation PhotoGalleryVC



#define IDENTIFIER_CELL @"HorizontalCell"


#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Call Api To get data of animals
    [self startFetchingAnimalsDetails];
    
    //Add Observer to get notified
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didClickOnImage:) name:NOTIFICATION_DID_CLICK_IMAGE object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - WebService Calling
-(void)startFetchingAnimalsDetails
{
    apiCallerGetAnimals = [[ApiCaller alloc]init];
    [apiCallerGetAnimals getAnimalsDetailsWithCompletionBlock:^(id dataResponse) {
        if(![dataResponse isKindOfClass:[NSError class]] && dataResponse!=nil)
        {
            //We got valid data & Process it accordingly
            dictPhotosData = [[[Parser alloc]init] parseDataFrom:dataResponse];
            NSLog(@"YES WE GOT PHOTOS %@",dictPhotosData);
            
            [Utils RunOnMainThread:^{
                [_tblViewPhotos reloadData];
            }];
            
            
        }
    } forPostData:nil];
}


#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dictPhotosData.allKeys count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HorizontalTableCell *cellHorizentalPhotos = [tableView dequeueReusableCellWithIdentifier:IDENTIFIER_CELL forIndexPath:indexPath];
    
    NSString *strPhotoType =[dictPhotosData allKeys][indexPath.row];
    cellHorizentalPhotos.lblPhotoType.text = [strPhotoType uppercaseString];
    cellHorizentalPhotos.arrPhotoTypes = [dictPhotosData objectForKey:strPhotoType];
    [cellHorizentalPhotos reloadGalleryPhotos];
    
    return cellHorizentalPhotos;
}

#pragma mark - Did Click On Image 
-(void)didClickOnImage:(NSNotification *)notObj
{
    NSMutableDictionary *dictUserInfo = [[notObj userInfo] mutableCopy];
    [self.imgViewPhoto setImageWithURL:[NSURL URLWithString:[dictUserInfo objectForKey:KEY_URL]] placeholderImage:nil usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];

}

@end

//
//  Constants.h
//  PhotoGallery
//
//  Created by datta on 05/11/15.
//  Copyright © 2015 Cuelogic Technologies. All rights reserved.
//

#ifndef Constants_h
#define Constants_h



#pragma mark - Enums


typedef enum
{
    kClickedIndexYES=1,
    kClickedIndexNO=0,
}kClickedIndex;



typedef enum
{
    kTagHttpMethodPost=1,
    kTagHttpMethodGet=2,
    kTagHttpMultipart=3,
}kTagHttpMethod;


typedef enum
{
    kRequestSerializerJson,
    kRequestSerializerHTTP
    
}kRequestSerializer;





#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#pragma mark - Staus Codes
#define STATUS_CODE_403 @"403"
#define STATUS_CODE_404 @"404"
#define STATUS_CODE_500 @"500"

#pragma mark - Screen Width and Height
#define SCREEN_HEIGHT [ [ UIScreen mainScreen ] bounds ].size.height
#define SCREEN_WIDTH [ [ UIScreen mainScreen ] bounds ].size.width


#define mark - Checking Devices
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_IPHONE_4 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )480 ) < DBL_EPSILON )
#define IS_IPHONE_6 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )667 ) < DBL_EPSILON )
#define IS_IPHONE_6P ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )1104 ) < DBL_EPSILON )






#define NOTIFICATION_DID_CLICK_IMAGE @"NOTIFICATION_DID_CLICK_IMAGE"


#endif /* Constants_h */

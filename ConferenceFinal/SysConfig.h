//
//  SysConfig.h
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-29.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MoreCtl;

@interface SysConfig : UIViewController
{
    MoreCtl *_moreCtl;
}

@property(nonatomic) MoreCtl *moreCtl;
- (IBAction)toUsrInfo:(id)sender;
- (IBAction)toModifyPaswrd:(id)sender;
- (IBAction)setHostNum:(id)sender;


@end

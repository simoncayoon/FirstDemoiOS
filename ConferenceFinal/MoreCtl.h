//
//  MoreCtl.h
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-22.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "HelpDoc.h"

@class SysConfig;

@protocol disableOtherBtn <NSObject>

- (void) disableBtn;

- (void) recoverBtn;

@end

@interface MoreCtl : UIViewController
{
    id<disableOtherBtn> _hideBtnDelegate;
    SysConfig *_sysConfig;
    HelpDoc *_helpDoc;
}


@property (weak, nonatomic) IBOutlet UIImageView *systemConfig;
@property (weak, nonatomic) IBOutlet UIImageView *confNotification;
@property (weak, nonatomic) IBOutlet UIImageView *callBookUpload;
@property (weak, nonatomic) IBOutlet UIImageView *aboutDoc;
@property (nonatomic, retain) id<disableOtherBtn> hideBtnDelegate;
@property (nonatomic, retain) SysConfig *sysConfig;
@property (nonatomic, retain) HelpDoc *helpDoc;

@end

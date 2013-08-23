//
//  SysConfig.h
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-29.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UsrInfo.h"
#import "SetPhoneNum.h"
#import "PasswrdConfig.h"

@class MoreCtl;

@interface SysConfig : UIViewController
{
    MoreCtl *_moreCtl;
}

@property(nonatomic) MoreCtl *moreCtl;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@property (retain, nonatomic) UsrInfo* myUsrInfo;
@property (retain, nonatomic) PasswrdConfig* myPassConf;
@property (retain, nonatomic) SetPhoneNum* mySetNum;



- (IBAction)toUsrInfo:(id)sender;
- (IBAction)toModifyPaswrd:(id)sender;
- (IBAction)setHostNum:(id)sender;


@end

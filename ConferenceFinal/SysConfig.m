//
//  SysConfig.m
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-29.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import "SysConfig.h"
#import "CustomLabel.h"
#import "UsrInfo.h"
#import "SetPhoneNum.h"
#import "PasswrdConfig.h"
#import "MoreCtl.h"

@interface SysConfig ()

@end

@implementation SysConfig

@synthesize moreCtl = _moreCtl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        CustomLabel *topLabel = [[CustomLabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49) newStyle:@"系统设置"];
        [topLabel.returnBtn addTarget:self action:@selector(returnPrevious) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:topLabel];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toUsrInfo:(id)sender {
    UsrInfo* myUsrInfo = [[UsrInfo alloc] init];
    [self presentViewController:myUsrInfo animated:NO completion:NULL];
}

- (IBAction)toModifyPaswrd:(id)sender {
    PasswrdConfig* myUsrInfo = [[PasswrdConfig alloc] init];
    [self presentViewController:myUsrInfo animated:NO completion:NULL];
}

- (IBAction)setHostNum:(id)sender {
    SetPhoneNum* myUsrInfo = [[SetPhoneNum alloc] init];
    [self presentViewController:myUsrInfo animated:NO completion:NULL];
}

#pragma mark delegate
- (void) testDelegate{
    NSLog(@" I delegate the method");
}

- (void) returnPrevious
{
    [self dismissViewControllerAnimated:NO completion:nil];
    [self.moreCtl.hideBtnDelegate recoverBtn];
}


@end

//
//  SysConfig.m
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-29.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import "SysConfig.h"
#import "CustomLabel.h"
#import "MoreCtl.h"

@interface SysConfig ()

@end

@implementation SysConfig

@synthesize moreCtl = _moreCtl;
@synthesize myUsrInfo;
@synthesize myPassConf;
@synthesize mySetNum;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        CustomLabel *topLabel = [[CustomLabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49) newStyle:@"系统设置"];
        [topLabel.returnBtn addTarget:self action:@selector(returnPrevious) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:topLabel];
        
        //实例化三个ctl
        myUsrInfo = [[UsrInfo alloc] init];
        myPassConf = [[PasswrdConfig alloc] init];
        mySetNum = [[SetPhoneNum alloc] init];
        
        //label 添加点击事件
        _label1.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickLabel1)];
        [_label1 addGestureRecognizer:singleTap1];
        
        _label2.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickLabel2)];
        [_label2 addGestureRecognizer:singleTap2];
        
        _label3.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickLabel3)];
        [_label3 addGestureRecognizer:singleTap3];
        
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
    [self presentViewController:myUsrInfo animated:NO completion:NULL];
}
-(void) onClickLabel1{
    [self presentViewController:myUsrInfo animated:NO completion:NULL];
}

- (IBAction)toModifyPaswrd:(id)sender {
    
    [self presentViewController:myPassConf animated:NO completion:NULL];
}
-(void) onClickLabel2{
    [self presentViewController:myPassConf animated:NO completion:NULL];
}

- (IBAction)setHostNum:(id)sender {
    [self presentViewController:mySetNum animated:NO completion:NULL];
}
-(void) onClickLabel3{
    [self presentViewController:mySetNum animated:NO completion:NULL];
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

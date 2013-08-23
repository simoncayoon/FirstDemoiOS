//
//  MoreCtl.m
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-22.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import "MoreCtl.h"
#import "CustomLabel.h"
#import "MainTabCtl.h"
#import "SysConfig.h"
#import "SVProgressHUD.h"
#import "MMProgressHUD.h"

@interface MoreCtl ()

@end

@implementation MoreCtl

@synthesize systemConfig ;
@synthesize confNotification;
@synthesize callBookUpload;
@synthesize aboutDoc;
@synthesize hideBtnDelegate = _hideBtnDelegate;
@synthesize sysConfig = _sysConfig;
@synthesize helpDoc = _helpDoc;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.view setBackgroundColor:[UIColor colorWithRed:232 green:232 blue:232 alpha:232]];
        //系统设置图标 可点击
        systemConfig.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClickImage)];
        [systemConfig addGestureRecognizer:singleTap];
        
        aboutDoc.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleTapView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage)];
        [aboutDoc addGestureRecognizer:singleTapView];
        
        confNotification.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapNotification = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showNotification)];
        [confNotification addGestureRecognizer:tapNotification];
        
        callBookUpload.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapUpload = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(upload)];
        [callBookUpload addGestureRecognizer:tapUpload];
        
        //导航图标
        CustomLabel *topLabel = [[CustomLabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49) setTitle:@"更多"];
        
        _sysConfig = [[SysConfig alloc]init];
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

-(void) onClickImage{
    
    _sysConfig = [[SysConfig alloc] init];
    [self presentViewController:_sysConfig animated:YES completion:nil];
    [self.hideBtnDelegate disableBtn];
    _sysConfig.moreCtl = self;
}

- (void) tapImage{
    
    _helpDoc = [[HelpDoc alloc] init];
    [self.hideBtnDelegate disableBtn];
    [self presentViewController:_helpDoc animated:YES completion:nil];
    _helpDoc.moreCtl = self;
}

- (void)showNotification{
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:hud];
    hud.labelText = @"暂时没收到邀请哦！！";
    [hud setLabelFont:[UIFont fontWithName:@"Helvetica" size:24]];
    hud.mode = MBProgressHUDModeText;
    
    [hud showAnimated:YES whileExecutingBlock:^{
        sleep(2);
    } completionBlock:^{
        [hud removeFromSuperview];
    }];
}

-(void) upload{

//    [SVProgressHUD showWithStatus:@"正在上传通讯录" maskType:SVProgressHUDMaskTypeGradient];
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [NSThread sleepForTimeInterval:0.5];
//        [SVProgressHUD dismiss];
//        
//    });
    BOOL autodismiss = YES;
    
    [MMProgressHUD showProgressWithStyle:MMProgressHUDProgressStyleRadial title:@"上传通讯录" status:nil];
    [[MMProgressHUD sharedHUD] setProgressCompletion:^{
        [MMProgressHUD dismissWithSuccess:@"上传成功!"];
    }];
    autodismiss = NO;
    
    double delayInSeconds = 1;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [MMProgressHUD updateProgress:0.33f];
        
        double delayInSeconds = 1;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [MMProgressHUD updateProgress:0.55f];
            
            double delayInSeconds = 0.8;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [MMProgressHUD updateProgress:0.80f];
                
                double delayInSeconds = 1.5;
                dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
                dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                    [MMProgressHUD updateProgress:1.f];
                    
                });
            });
        });
    });
}

@end

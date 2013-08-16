//
//  DropMenuCtl.m
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-31.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import "DropMenuCtl.h"
#import "MBProgressHUD.h"

@interface DropMenuCtl ()

@end

@implementation DropMenuCtl
@synthesize quietMode;
@synthesize confLock;
@synthesize confRecord;
@synthesize delegate = _delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil frame:(CGRect) frame
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        rect = frame;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view = [[UIView alloc] initWithFrame:rect];
    self.view.clipsToBounds = YES;
    //设置背景图片
    UIImageView* backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, 120)];
    [backgroundImage setImage:[UIImage imageNamed:@"hkxlbg.png"]];
    [self.view addSubview:backgroundImage];
    
    //添加按钮控件
    quietMode = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, rect.size.width, 25)];
    quietMode.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:12.0];
    [quietMode setTitle:@"全部静音" forState:UIControlStateNormal];
    quietMode.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    quietMode.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
    [quietMode addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:quietMode];
    
    confLock = [[UIButton alloc] initWithFrame:CGRectMake(0, 45, rect.size.width, 25)];
    confLock.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:12.0];
    [confLock setTitle:@"会议锁定" forState:UIControlStateNormal];
    confLock.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    confLock.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
    [confLock addTarget:self action:@selector(click1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confLock];
    
    confRecord = [[UIButton alloc] initWithFrame:CGRectMake(0, 78, rect.size.width, 25)];
    confRecord.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:12.0];
    [confRecord setTitle:@"会议录音" forState:UIControlStateNormal];
    confRecord.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    confRecord.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
    [confRecord.titleLabel setText:@"会议录音"];
    [confRecord.titleLabel setTextAlignment:NSTextAlignmentRight];
    [confRecord addTarget:self action:@selector(click2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confRecord];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) click{
    if([_delegate respondsToSelector:@selector(showToast:)]){
        [_delegate showToast:quietMode.titleLabel.text];
    }else{
        NSLog(@"_delegate is not respond");
    }
}

- (void) click1{
    if([_delegate respondsToSelector:@selector(showToast:)]){
        [_delegate showToast:confLock.titleLabel.text];
    }else{
        NSLog(@"_delegate is not respond");
    }
}

- (void) click2{
    if([_delegate respondsToSelector:@selector(showToast:)]){
        [_delegate showToast:confRecord.titleLabel.text];
    }else{
        NSLog(@"_delegate is not respond");
    }
}

- (void) shareRootController:(UIViewController *)app
{
    test = app;
}

@end

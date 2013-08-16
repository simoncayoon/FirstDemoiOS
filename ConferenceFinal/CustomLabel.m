//
//  CustomLabel.m
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-29.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import "CustomLabel.h"
#import "MBProgressHUD.h"

@implementation CustomLabel

@synthesize saveBtn = _saveBtn;
@synthesize returnBtn = _returnBtn;


- (id)initWithFrame:(CGRect)frame setTitle:(NSString*) title
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //绘制导航label
        UILabel* topLabel = [[UILabel alloc] initWithFrame:frame];
        topLabel.text = title;
        [topLabel setTextAlignment:NSTextAlignmentCenter];
        [topLabel setFont:[UIFont fontWithName:@"Helvetica" size:30]];
        [topLabel setTextColor:[UIColor whiteColor]];
        topLabel.backgroundColor = [UIColor clearColor];
        
        //背景图片
        UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:frame];
        [backgroundImage setImage:[UIImage imageNamed:@"top.png"]];
        [self addSubview:backgroundImage];
        [self addSubview:topLabel];
    }
    return self;
}

- (id) initWithFrame:(CGRect) frame newStyle:(NSString*) tag{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //navigation background view
        UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:frame];
        [backgroundImage setImage:[UIImage imageNamed:@"top.png"]];
        [self addSubview:backgroundImage];
        
        //绘制导航label
        UILabel* topLabel = [[UILabel alloc] initWithFrame:frame];
        topLabel.text = tag;
        [topLabel setTextAlignment:NSTextAlignmentCenter];
        [topLabel setFont:[UIFont fontWithName:@"Helvetica" size:30]];
        [topLabel setTextColor:[UIColor whiteColor]];
        topLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:topLabel];
        
        _returnBtn = [[UIButton alloc] initWithFrame:CGRectMake(2, 2, 47, 47)];
        [_returnBtn setBackgroundImage:[UIImage imageNamed:@"back_default.png"] forState:UIControlStateNormal];
        [self addSubview:_returnBtn];
        _saveBtn = [[UIButton alloc] initWithFrame:CGRectMake(260, 12, 56, 31)];
        [_saveBtn setBackgroundImage:[UIImage imageNamed:@"topiconbg.png"] forState:UIControlStateNormal];
        [_saveBtn addTarget:self action:@selector(showDialog) forControlEvents:UIControlEventTouchUpInside];
        [_saveBtn setTitle:@"保存" forState:UIControlStateNormal];
        [self addSubview:_saveBtn];
        
    }
    return self;
}


-(void) showDialog{

    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self];
    [self addSubview:hud];
    hud.labelText = @"保存成功";
    hud.mode = MBProgressHUDModeText;
    
    [hud showAnimated:YES whileExecutingBlock:^{
        sleep(2);
    } completionBlock:^{
        [hud removeFromSuperview];
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

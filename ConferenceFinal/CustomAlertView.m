//
//  CustomAlertView.m
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-26.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import "CustomAlertView.h"

#define STYLE

@implementation CustomAlertView

@synthesize backgroundImage;
@synthesize contentImage;
@synthesize actionConfBtn;
@synthesize cancelBtn;
@synthesize upLabel = _upLabel;
@synthesize downLabel = _downLabel;
@synthesize upText,downText;

-(id) initWithImage:(UIImage *)image contentImage:(UIImage *)content upText:(NSString *)up downText:(NSString *)down
{
    backgroundImage = nil;
    contentImage = nil;
    //Initialzation code
    if(self == [super init]){
        self.backgroundImage  = image;
        self.contentImage = content;
        self.upText = up;
        self.downText = down;
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
//    CGSize imageSize = self.backgroundImage.size;
    [self.backgroundImage drawInRect:CGRectMake(0, 0, 300, 230)];
}

#pragma mark private method

#ifdef STYLE

- (void) layoutSubviews {
    //屏蔽系统的ImageView 和 UIButton
    for (UIView *v in [self subviews]) {
        if ([v class] == [UIImageView class]){
            [v setHidden:YES];
        }
        
        
        if ([v isKindOfClass:[UIButton class]] ||
            [v isKindOfClass:NSClassFromString(@"UIThreePartButton")]) {
            [v setHidden:YES];
        }
    }
    if (contentImage) {
        UIImageView *contentview = [[UIImageView alloc] initWithImage:self.contentImage];
        contentview.frame = CGRectMake(0, 0, 300, 230);
        [self addSubview:contentview];
    }
    
    _upLabel = [[UILabel alloc]  initWithFrame:CGRectMake(20, 34, 280, 21)];
    _upLabel.text = self.upText;
    _upLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_upLabel];
    
    _downLabel = [[UILabel alloc]  initWithFrame:CGRectMake(20, 85, 280, 21)];
    _downLabel.text = self.downText;
    _downLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_downLabel];
    
    actionConfBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 150, 110, 36)];
    actionConfBtn.tag = 1;
    [actionConfBtn setBackgroundImage:[UIImage imageNamed:@"again.png"] forState:UIControlStateNormal];
    [actionConfBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:actionConfBtn];
    
    cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(180, 150, 86, 36)];
    cancelBtn.tag = 2;
    [cancelBtn setBackgroundImage:[UIImage imageNamed:@"quxiao.png"] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancelBtn];
}

#else
- (void) setNeedsLayout
{
    //屏蔽系统的ImageView 和 UIButton
    for (UIView *v in [self subviews]) {
        if ([v class] == [UIImageView class]){
            [v setHidden:YES];
        }
        
        
        if ([v isKindOfClass:[UIButton class]] ||
            [v isKindOfClass:NSClassFromString(@"UIThreePartButton")]) {
            [v setHidden:YES];
        }
    }
    if (contentImage) {
        UIImageView *contentview = [[UIImageView alloc] initWithImage:self.contentImage];
        contentview.frame = CGRectMake(0, 0, 300, 230);
        [self addSubview:contentview];
    }
    
    _upLabel = [[UILabel alloc]  initWithFrame:CGRectMake(20, 34, 136, 21)];
    _upLabel.text = @"我 张正东 陈坤 谢冰涵";
    [self addSubview:_upLabel];
    
    _downLabel = [[UILabel alloc]  initWithFrame:CGRectMake(20, 85, 85, 21)];
    
    [self addSubview:_downLabel];
    
    actionConfBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 150, 110, 36)];
    actionConfBtn.tag = 1;
    [actionConfBtn setBackgroundImage:[UIImage imageNamed:@"again.png"] forState:UIControlStateNormal];
    [actionConfBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:actionConfBtn];
    
    cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(180, 150, 86, 36)];
    cancelBtn.tag = 2;
    [cancelBtn setBackgroundImage:[UIImage imageNamed:@"quxiao.png"] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:cancelBtn];
}
#endif

-(void) buttonClicked:(id)sender
{
    [self dismissWithClickedButtonIndex:0 animated:YES];
}

- (void) show {
    [super show];
    //    CGSize imageSize = self.backgroundImage.size;
//    self.bounds = CGRectMake(0, 0, self.backgroundImage.size.width, self.backgroundImage.size.height);
//    self.transform = CGAffineTransformTranslate( self.transform, 0.0, 200.0 );
    self.frame = CGRectMake(350, 300, 320, 191);
}

@end


//
//  DropdownMenu.m
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-30.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import "DropdownMenu.h"

@implementation DropdownMenu

@synthesize backgroundView = _backgroudView;
@synthesize quietMode = _quietMode;
@synthesize confLock = _confLock;
@synthesize confRecord = _confRcord;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        _backgroudView = [[UIImageView alloc] initWithFrame:frame];
//        _backgroudView = [[UIImageView alloc] init];
//        [_backgroundView setImage:[UIImage imageNamed:@"hkxlbg.png"]];
//        [self addSubview:_backgroudView];
        
//        _quietMode = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.origin.x + 10, self.frame.origin.y + 5, self.frame.size.width - 10, frame.size.height/3 - 5)];
//        [_quietMode setTitle:@"全部静音" forState:UIControlStateNormal];
//        [self addSubview:_quietMode];
        
//        self.confLock = [UIButton alloc] initWithFrame:];
//        [self.confLock setTitle:@"会议锁定" forState:UIControlStateNormal];
//        
//        self.confRcord = [[UIButton alloc] initWithFrame:];
//        self.confRcord setTitle:@"会议录音" forState:UIControlStateNormal];
        
        //绑定nib文件
        
    }
    return self;
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

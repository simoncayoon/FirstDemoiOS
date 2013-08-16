//
//  DropdownMenu.h
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-30.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropdownMenu : UIView
{
    UIImageView *_backgroundView;
    UIButton *_quietMode, *_confLock, *_confRecord;
}

@property(nonatomic, retain) UIImageView* backgroundView;
@property(nonatomic, retain) UIButton* quietMode;
@property(nonatomic, retain) UIButton* confLock;
@property(nonatomic, retain) UIButton* confRecord;

@end

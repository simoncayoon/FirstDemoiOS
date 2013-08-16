//
//  CustomLabel.h
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-29.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "returnDelegate.h"



@interface CustomLabel : UIView {
    UIButton *_saveBtn, *_returnBtn;
}

@property(nonatomic, retain) UIButton* saveBtn;
@property(nonatomic, retain) UIButton* returnBtn;


- (id) initWithFrame:(CGRect) frame setTitle:(NSString*) title;
- (id) initWithFrame:(CGRect) frame newStyle:(NSString*) tag;
- (void) showDialog;

@end

//
//  DropMenuCtl.h
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-31.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol toastView <NSObject>

-(void) showToast:(NSString* )btnTitle;

@end

@interface DropMenuCtl : UIViewController
{
    CGRect rect;
    UIViewController *test;
    id <toastView> _delegate;
}

@property(nonatomic, retain) UIButton* quietMode;
@property(nonatomic, retain) UIButton* confLock;
@property(nonatomic, retain) UIButton* confRecord;
@property(nonatomic, retain) id <toastView> delegate;

- (void) shareRootController:(UIViewController *) app;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil frame:(CGRect) frame;

@end

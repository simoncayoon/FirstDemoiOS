//
//  CustomAlertView.h
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-26.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface CustomAlertView : UIAlertView
{
    UILabel *_upLabel, *_downLabel;
}

@property(readwrite, retain) UIImage *backgroundImage;
@property(readwrite, retain) UIImage *contentImage;
@property(nonatomic, retain) UIButton *actionConfBtn;
@property(nonatomic, retain) UIButton *cancelBtn;

@property(nonatomic, readwrite) UILabel *upLabel;
@property(nonatomic, readwrite) UILabel *downLabel;

@property (strong,nonatomic) NSString *upText,*downText;

-(id) initWithImage:(UIImage *)image contentImage:(UIImage *)content upText:(NSString *)up downText:(NSString *)down;

@end

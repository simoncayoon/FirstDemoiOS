//
//  CustomCell.h
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-23.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
{
    
    UILabel* _usrName;
    UILabel* _usrNum;

    //添加cell组件定义
    UIImageView* _headPortrait;
    UIImageView* _holdingState;
    UIButton* _hangUpState ;
    UIButton* _lsnOrDelState;
    BOOL _defaultOrActionState;
    
    //联系人组件定义
    UIButton* _checkBtn;
    
    //
}

@property(nonatomic, retain) UIImageView *headPortrait, *holdingState;
@property(nonatomic, retain) UILabel *usrName, *usrNum;
@property(nonatomic, retain) UIButton *hangUpState, *lsnOrDelState;
@property(atomic) BOOL defaultOrActionState;
@property(nonatomic, retain) UIButton* checkBtn;
@property(atomic) BOOL checkState;

-(BOOL) setActionState:(BOOL)state;
-(void) setSelectState:(BOOL)state;
- (BOOL) getCheckState;

//custom init method
-(id) initForContractList:(UITableViewCellStyle)style reuseIdentifier:(NSString *) reuseable;

@end

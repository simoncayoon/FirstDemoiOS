//
//  CustomCell.m
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-23.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize headPortrait = _headPortrait;
@synthesize holdingState = _holdingState;
@synthesize usrName = _usrName;
@synthesize usrNum = _usrNum;
@synthesize hangUpState = _hangUpState;
@synthesize lsnOrDelState = _lsnOrDelState;
@synthesize defaultOrActionState = _defaultOrActionState;
@synthesize checkBtn = _checkBtn;
@synthesize checkState;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setSelectState:NO];
        
        //add cell head portrait
        _headPortrait = [[UIImageView alloc] initWithFrame:CGRectMake(7, 1, 43, 43)];
        
        //add client state
        _holdingState = [[UIImageView alloc] initWithFrame:CGRectMake(40, 15, 23, 18)];
//        [_holdingState setHidden:YES];
        
        //add client name
        _usrName = [[UILabel alloc] initWithFrame:CGRectMake(63, 1, 42, 21)];
        _usrName.font = [UIFont fontWithName:@"Helvetica" size:14];
        
        //add clientNum
        _usrNum = [[UILabel alloc] initWithFrame:CGRectMake(63, 20, 129, 21)];
        
        _usrNum.font = [UIFont fontWithName:@"Helvetica" size:17];
        
        //add interrupt & listening
        
        _hangUpState = [[UIButton alloc] initWithFrame:CGRectMake(189, 12, 49, 21)];
        
        _lsnOrDelState = [[UIButton alloc] initWithFrame:CGRectMake(254, 12, 49, 21)];
        
        [self.contentView addSubview:_headPortrait];
        [self.contentView addSubview:_holdingState];
        [self.contentView addSubview:_usrName];
        [self.contentView addSubview:_usrNum];
        [self.contentView addSubview:_hangUpState];
        [self.contentView addSubview:_lsnOrDelState];
    }
    return self;
}

-(id) initForContractList:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseable
{
    self = [super initWithStyle:style reuseIdentifier:reuseable];
    if (self) {
        // Initialization code
        self.checkState = NO;
        
        //勾线按钮
        _checkBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 10, 22, 24)];
        _checkBtn.enabled = NO;
        [_checkBtn setImage:[UIImage imageNamed:@"goux_default.png"] forState:UIControlStateNormal];
        [_checkBtn addTarget:self action:@selector(selected:) forControlEvents:UIControlEventTouchUpInside];
        
        //联系人姓名
        _usrName = [[UILabel alloc] initWithFrame:CGRectMake(45, 15, 70, 15)];
        [_usrName setFont:[UIFont fontWithName:@"System" size:14]];
        //联系人号码
        _usrNum = [[UILabel alloc] initWithFrame:CGRectMake(120, 15, 182, 15)];
        [_usrNum setFont:[UIFont fontWithName:nil size:14]];
        
        [self.contentView addSubview:_checkBtn];
        [self.contentView addSubview:_usrName];
        [self.contentView addSubview:_usrNum];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(BOOL) setActionState:(BOOL)state{
    return NO;
}

-(void) setSelectState:(BOOL)state{
    
    self.checkState = state;
    if(checkState == YES){
        [self.checkBtn setImage:[UIImage imageNamed:@"goux_click.png"] forState:UIControlStateNormal];
    }else{
        [self.checkBtn setImage:[UIImage imageNamed:@"goux_default.png"] forState:UIControlStateNormal];
    }
}

-(BOOL) getCheckState{
    return self.checkState;
}

@end

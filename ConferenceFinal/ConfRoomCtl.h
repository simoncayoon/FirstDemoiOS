//
//  ConfRoomCtl.h
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-22.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActionListController.h"
#import "DropdownMenu.h"
#import "DropMenuCtl.h"

@protocol toCallBookDelegate <NSObject>

@optional
-(void) showControllerOfTow;

@end

@interface ConfRoomCtl : UIViewController<toastView>
{
    ActionListController *_confAction;
    UIButton* _conferenceControllBtn;
    DropMenuCtl *_dropdownMenu;
    
    //跳转到通讯录
    id<toCallBookDelegate> _delegate;
    NSMutableDictionary *_imgDicOfActionList;
}


@property (weak, nonatomic) IBOutlet UITextField *numEdit;
@property (weak, nonatomic) IBOutlet UIImageView *hangUp;
@property (weak, nonatomic) IBOutlet UIImageView *respon;
//@property (nonatomic) DropdownMenu *dropdownMenu;
@property (nonatomic) DropMenuCtl *dropdownMenu;
@property (nonatomic) BOOL isShow;
@property (nonatomic, retain) id<toCallBookDelegate> delegate;
//主持人状态
@property (weak, nonatomic) IBOutlet UIImageView *toux;
@property (nonatomic, retain) ActionListController *confAction;
@property (nonatomic, retain) NSMutableDictionary *imgDicOfActionList;

- (IBAction)actionConf:(id)sender;
- (IBAction)toCallbook:(id)sender;
- (IBAction)addNum:(id)sender;
- (void) showList;

//hide the keyboard
- (IBAction)textFiledReturnEditing:(id)sender;
- (IBAction)backgroundTap:(id)sender;

@end

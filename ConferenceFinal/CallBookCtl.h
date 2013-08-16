//
//  CallBookCtl.h
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-22.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactListViewController.h"

@protocol callBookDelegate <NSObject>

@optional
- (void) showFromCallBook:(NSMutableDictionary*) dataArray;

@end

@interface CallBookCtl : UIViewController<cancelSelectAll>
{
    ContactListViewController* _callList;
    id<callBookDelegate> _delegate;
    NSMutableDictionary* _listDataSource;
}

@property (nonatomic, readwrite, retain) NSMutableDictionary* listDataSource;
@property (weak, nonatomic) IBOutlet UIView *callBookBG;
@property (weak, nonatomic) IBOutlet UIButton *checkBtn;
@property (weak, nonatomic) IBOutlet UITextField *serchEdit;
@property (nonatomic) BOOL selState;
@property (nonatomic, retain) id<callBookDelegate> delegate;
@property (nonatomic, retain) NSMutableDictionary* mySelectedData;

- (IBAction)selectAllOrNot:(id)sender;
- (IBAction)addToConfRoom:(id)sender;
- (IBAction)hideKeyboard:(id)sender;

@end

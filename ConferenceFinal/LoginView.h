//
//  LoginView.h
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-21.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabCtl.h"

@interface LoginView : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *usrName;
@property (retain, nonatomic) IBOutlet UITextField *paswrd;

- (IBAction)loginAction:(id)sender;

@end

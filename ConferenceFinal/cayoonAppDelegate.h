//
//  cayoonAppDelegate.h
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-21.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginView.h"

@interface cayoonAppDelegate : UIResponder <UIApplicationDelegate>{

    LoginView* _myLoginView;
}

@property (retain, nonatomic) LoginView* myLoginView;
@property (strong, nonatomic) UIWindow *window;

@end

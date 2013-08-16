//
//  ConfRoomCtl.m
//  ConferenceFinal
//
//  Created by simon_cayoon on 13-7-22.
//  Copyright (c) 2013年 EtengInfo. All rights reserved.
//

#import "ConfRoomCtl.h"
#import "CustomCell.h"
#import "MainTabCtl.h"
#import "ActionListController.h"
#import "CustomLabel.h"
#import "MBProgressHUD.h"

@interface ConfRoomCtl ()

@end

@implementation ConfRoomCtl

bool actionCheckState = NO;

@synthesize numEdit;
@synthesize isShow;
@synthesize dropdownMenu = _dropdownMenu;
@synthesize delegate = _delegate;
@synthesize confAction = _confAction;
@synthesize imgDicOfActionList = _imgDicOfActionList;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    [self.view setFrame:CGRectMake(0, 0, 320, 402)];
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.numEdit setPlaceholder:@"请输入号参会人号码"];
        _confAction = [[ActionListController alloc] init];
        
        //会议控制按钮
        _conferenceControllBtn = [[UIButton alloc] initWithFrame:CGRectMake(230, 8, 80, 35)];

        [_conferenceControllBtn setBackgroundImage:[UIImage imageNamed:@"topiconbg.png"] forState:UIControlStateNormal];
        [_conferenceControllBtn setTitle:@"会控" forState:UIControlStateNormal];
        [_conferenceControllBtn setHidden:YES];
        [_conferenceControllBtn addTarget:self action:@selector(_conferenceControllBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        //会控下拉菜单
        _dropdownMenu = [[DropMenuCtl alloc] initWithNibName:nil bundle:nil frame:CGRectMake(_conferenceControllBtn.frame.origin.x, _conferenceControllBtn.frame.origin.y +_conferenceControllBtn.bounds.size.height, _conferenceControllBtn.bounds.size.width, 0)];
        
        //导航图标
        CustomLabel *topLabel = [[CustomLabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 49) setTitle:@"会议室"];
        
        //会议名单列表
        [_confAction.tableView setFrame:CGRectMake(0, 150, 320, 175)];
        [_confAction.tableView setBackgroundColor:[UIColor colorWithRed:241 green:241 blue:241 alpha:1]];
        
        [self.view addSubview:topLabel];
        [self.view addSubview:_conferenceControllBtn];
        [self.view addSubview:_dropdownMenu.view];
        
        //delegate
        _dropdownMenu.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionConf:(id)sender {
    
    //设置"发起会议"按钮背景图片
    if([_confAction.tableView numberOfRowsInSection:0] != 0){
        
        self.hangUp.hidden = actionCheckState;
        self.respon.hidden = actionCheckState;
        _conferenceControllBtn.hidden= actionCheckState;
        self.numEdit.enabled = actionCheckState;
        _confAction.action = !actionCheckState;
        
        if(NO == actionCheckState){
            [sender setImage:[UIImage imageNamed:@"end.png"] forState:UIControlStateNormal];
            [self.toux setImage:[UIImage imageNamed:@"toux1A.png"]];
            [_confAction.tableView reloadData];
            
        }else{
            [sender setImage:[UIImage imageNamed:@"start.png"] forState:UIControlStateNormal];
            [self.toux setImage:[UIImage imageNamed:@"toux1.png"]];
            //清除tableview中的数据
            [_confAction.arrayRow removeAllObjects];
            _confAction.dataDic = nil;
            [_confAction.tableView removeFromSuperview];
            [_confAction.tableView reloadData];
        }
         actionCheckState = !actionCheckState;
    }else{
        MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:hud];
        hud.labelText = @"请至少添加一个参会人！";
        hud.mode = MBProgressHUDModeText;
        
        [hud showAnimated:YES whileExecutingBlock:^{
            sleep(2);
        } completionBlock:^{
            [hud removeFromSuperview];
        }];
    }
}

- (IBAction)toCallbook:(id)sender {

    //调用代理
    if([_delegate respondsToSelector:@selector(showControllerOfTow)]){
        [_delegate showControllerOfTow];
    }else{
        NSLog(@"delegate in not responds");
    }
    
}

- (IBAction)addNum:(id)sender {
    if(numEdit.text.length == 0){
        //输入出错提示
        [numEdit setPlaceholder:@"在这里输添加号码！"];
        
        //号码错误提示
        MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:hud];
        hud.labelText = @"请输入正确的电话号码";
        hud.mode = MBProgressHUDModeText;
        
        [hud showAnimated:YES whileExecutingBlock:^{
            sleep(2);
        } completionBlock:^{
            [hud removeFromSuperview];
        }];
    }else{
        //在会议室窗口 绘制列表
        [_confAction.arrayRow addObject:numEdit.text];
        [_confAction addCell];
        [self showList];
        numEdit.text = nil;
    }
}

-(IBAction)textFiledReturnEditing:(id)sender{
    [sender resignFirstResponder];
}

-(IBAction)backgroundTap:(id)sender{
    [numEdit resignFirstResponder];
}

- (void) _conferenceControllBtnClick:(UIButton *)btn
{
    
    if(!self.isShow){
        self.isShow = YES;
        [UIView beginAnimations:@"ddd" context:nil];//设置动画 ddd为动画名称
        [UIView setAnimationDuration:0.2];//定义动画持续时间
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut]; //setAnimationCurve来定义动画加速或减速方式
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.dropdownMenu.view cache:NO];
        [UIView setAnimationDelegate:self];  //设置动画的代理 实现动画执行前后的方法 在commitAnimation之前设置
        _dropdownMenu.view.frame = CGRectMake(btn.frame.origin.x, btn.frame.size.height + btn.frame.origin.y - 5, btn.bounds.size.width, 120);
        [UIView commitAnimations]; //提交动画
        
    }else {
        self.isShow = NO;
        [UIView beginAnimations:@"ddd" context:nil];//设置动画 ddd为动画名称
        [UIView setAnimationDuration:0.2];//定义动画持续时间
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut]; //setAnimationCurve来定义动画加速或减速方式
        [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.dropdownMenu.view cache:NO];
        [UIView setAnimationDelegate:self];  //设置动画的代理 实现动画执行前后的方法 在commitAnimation之前设置
        [UIView setAnimationDidStopSelector:@selector(stop)];//设置动画结束后执行的方法
        _dropdownMenu.view.frame = CGRectMake(btn.frame.origin.x, btn.bounds.size.height + btn.frame.origin.y, btn.bounds.size.width, 0);
        [UIView commitAnimations]; //提交动画
    }
}
- (void) showList{
    
    [self.view addSubview:_confAction.tableView];
//    [_confAction.tableView reloadData];
}

- (void) showToast:(NSString *)btnTitle{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:hud];
    hud.labelText = [NSString stringWithFormat:@"%@开启", btnTitle];
    hud.mode = MBProgressHUDModeText;
    
    [hud showAnimated:YES whileExecutingBlock:^{
        sleep(1);
    } completionBlock:^{
        [hud removeFromSuperview];
    }];
}

@end


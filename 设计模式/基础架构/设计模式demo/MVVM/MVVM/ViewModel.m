//
//  ViewModel.m
//  MVVM
//
//  Created by yunna on 2018/12/1.
//  Copyright © 2018年 yunna. All rights reserved.
//

#import "ViewModel.h"
#import "APPView.h"
#import "APPModel.h"

@interface ViewModel ()<MyAppViewDelegate>
@property (weak, nonatomic) UIViewController *controller;
@end

@implementation ViewModel
- (instancetype)initWithController:(UIViewController *)controller{
    if (self = [super init]) {
        
        _controller = controller;
        //创建view
        APPView *app = [[APPView alloc]initWithFrame:CGRectMake(100, 100, 100, 150)];
        app.delegate = self;
        [controller.view addSubview:app];
        
        //创建model
        APPModel *model = [[APPModel alloc]init];
        model.name = @"我是一片云";
        model.image = @"cloud";
        
        //赋值
        app.model = model;
    }
    
    return self;
}

#pragma mark -- view点击事件 --
- (void)appViewDidClick:(APPView *)appView{
    NSLog(@"点击了view");
    
    appView.model.name = [NSString stringWithFormat:@"%d",arc4random()%100];
    
    NSLog(@"%@",appView.model.name);
}

@end

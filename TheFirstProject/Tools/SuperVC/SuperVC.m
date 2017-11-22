//
//  SuperVC.h
//
//
//  Created by hubin on 15/1/1.
//  Copyright (c) 2015 cnmobi. All rights reserved.
//

#import "SuperVC.h"

@interface SuperVC ()

@end

@implementation SuperVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self useMethodToFindBlackLineAndHidden];//去除navigationbar下面的黑线
}


/// 返回上一层视图
- (void)backVC
{
    [self.navigationController popViewControllerAnimated:YES];
}


/** 当设置navigationBar的背景图片或背景色时，使用该方法都可移除黑线，且不会使translucent属性失效 */
-(void)useMethodToFindBlackLineAndHidden
{
    UIImageView* blackLineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    //隐藏黑线（在viewWillAppear时隐藏，在viewWillDisappear时显示）
    blackLineImageView.hidden = YES;
}
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view
{
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0)
    {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}


/** 输入框取消响应  */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}


//#pragma mark - 横竖屏相关
//
///// 经测试，iPad的首页即使不需要旋转，也要返回YES（因为横屏启动时系统需要自动旋转到正确的方向）
//- (BOOL)shouldAutorotate
//{
//    return YES;
//}
//
///// 支持哪些方向
//- (UIInterfaceOrientationMask)supportedInterfaceOrientations
//{
//    return UIInterfaceOrientationMaskPortrait;
//}
//
///// 优先显示的屏幕方向
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
//{
//    return UIInterfaceOrientationPortrait;
//}


/*
/// 添加进入后台的通知实现
- (void)addEnterBackgroundNotification
{
    [kNotificationCenter addObserver:self selector:@selector(appDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:Nil];
}
/// 应用进入后台时
- (void)appDidEnterBackground
{
    
}

/// 添加进入前台的通知实现
- (void)addEnterForegroundNotification
{
    [kNotificationCenter addObserver:self selector:@selector(appEnterForeground) name:UIApplicationWillEnterForegroundNotification object:Nil];
}
/// 应用进入前台时
- (void)appEnterForeground
{
    
}
*/



@end

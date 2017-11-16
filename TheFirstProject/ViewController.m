//
//  ViewController.m
//  TheFirstProject
//
//  Created by libin on 17/11/14.
//  Copyright © 2017年 Cnmobi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, copy) NSString *name;
@property(nonatomic,strong) UIButton *testButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name = @"张三";
    self.testButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.testButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.testButton];
    
   
    WeakSelf;
    [self.testButton addAction:^(UIButton *btn) {
        NSLog(@"我被点名了%@",weakSelf.name);
        weakSelf.name = @"李四";
        NSLog(@"我被点名了%@",weakSelf.name);
        weakSelf.name = @"李四";
        NSLog(@"我被点名了%@",weakSelf.name);
    }];
    
    NSLog(@"%@",self.name);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

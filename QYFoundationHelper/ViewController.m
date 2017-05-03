//
//  ViewController.m
//  QYFoundationHelper
//
//  Created by liuming on 2017/2/7.
//  Copyright © 2017年 burning. All rights reserved.
//

#import "ViewController.h"
#import "QYMutableDictionary.h"
#import "QYPerson.h"
#import "NSScanner+QYPinyin.h"
#import "UIView+QYAnimation.h"
#import "PLPendulumAnimationView.h"
@interface ViewController ()

@end
//SYNTHESIZE_SINGLETON_FOR_CLA
@implementation ViewController

SYNTHESIZE_SINGLETON_FOR_CLASS(ViewController)

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    PLPendulumAnimationView * view = [[PLPendulumAnimationView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    
    [self.view addSubview: view];

}

- (void)btnClickedAction:(UIButton *)sender{

    NSLog(@".......");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

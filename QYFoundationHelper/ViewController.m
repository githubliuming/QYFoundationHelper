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
@interface ViewController ()

@end
//SYNTHESIZE_SINGLETON_FOR_CLA
@implementation ViewController

SYNTHESIZE_SINGLETON_FOR_CLASS(ViewController)

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    QYMutableDictionary * dic = [[QYMutableDictionary alloc] init];
    [dic setObject:@"1" forKey:@"22"];
    [dic setObject:@"1" forKey:@"222"];
    [dic setObject:@"1" forKey:@"2222"];
    [dic setObject:@"1" forKey:@"221"];
    [dic setObject:@"1" forKey:@"223"];
    [dic setObject:@"1" forKey:@"224"];
    [dic setObject:@"1" forKey:@"225"];
    
    NSLog(@"%@",dic);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

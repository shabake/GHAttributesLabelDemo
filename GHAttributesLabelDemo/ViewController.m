//
//  ViewController.m
//  GHAttributesLabelDemo
//
//  Created by zhaozhiwei on 2019/1/20.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "ViewController.h"
#import "GHAttributesLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    GHAttributesLabel *attributesLabel = [[GHAttributesLabel alloc]initWithFrame:CGRectMake(10, 200, [UIScreen mainScreen].bounds.size.width - 20, 44)];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:@"我已经阅读并同意《注册协议》"];
    [attrStr addAttribute:NSLinkAttributeName
                    value:@"《注册协议》"
                    range:NSMakeRange(8, 6)];
    [attrStr addAttribute:NSFontAttributeName
                    value:[UIFont systemFontOfSize:20]
                    range:NSMakeRange(0, attrStr.length)];
    
    attributesLabel.actionBlock = ^{
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"被点击了" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"我知道了", nil];
        [alertView show];
    };
    
    [attributesLabel setAttributesText:attrStr actionText:@"《注册协议》"];
    
    [self.view addSubview:attributesLabel];
}


@end

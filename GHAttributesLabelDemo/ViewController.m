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

    GHAttributesLabel *attributesLabel = [[GHAttributesLabel alloc]initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.height, 44)];
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:@"这是一个带点击功能的label,点我试一下"];
    [attrStr addAttribute:NSLinkAttributeName
                    value:@"点我"
                    range:NSMakeRange(16, 2)];
    attributesLabel.actionBlock = ^{
        NSLog(@"点击了");
    };
    [attributesLabel setAttributesText:attrStr actionText:@"点我"];
    [self.view addSubview:attributesLabel];
}


@end

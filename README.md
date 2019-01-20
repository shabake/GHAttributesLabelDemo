
![](https://img.shields.io/badge/platform-iOS-red.svg) ![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 
![](https://img.shields.io/appveyor/ci/gruntjs/grunt.svg)


# GHAttributesLabelDemo

---

部分文字实现点击功能的label

使用简单 集成方便 对原有项目无污染

![Untitled.gif](https://upload-images.jianshu.io/upload_images/1419035-65ae9ef9bb2d953c.gif?imageMogr2/auto-orient/strip)

使用方法:

```
/**

 @param text 传入富文本类型的字符串
 @param actionText 要响应事件的字符串
 */
- (void)setAttributesText: (NSMutableAttributedString *)text
               actionText: (NSString *)actionText;
```
```

/**
 点击事件回调
 */
@property (nonatomic , copy) GHAttributesBlock actionBlock;
```

举例:

```
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
```


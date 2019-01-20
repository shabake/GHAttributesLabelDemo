//
//  GHAttributesLabel.m
//  GHAttributesLabelDemo
//
//  Created by zhaozhiwei on 2019/1/20.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import "GHAttributesLabel.h"

@interface GHTextView : UITextView


@end
@implementation GHTextView

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    // 返回NO为禁用，YES为开启
    // 粘贴
    if (action == @selector(paste:)) return NO;
    // 剪切
    if (action == @selector(cut:)) return NO;
    // 复制
    if (action == @selector(copy:)) return NO;
    // 选择
    if (action == @selector(select:)) return NO;
    // 选中全部
    if (action == @selector(selectAll:)) return NO;
    // 删除
    if (action == @selector(delete:)) return NO;
    // 分享
    if (action == @selector(share)) return NO;
    return [super canPerformAction:action withSender:sender];
}

- (BOOL)canBecomeFirstResponder {
    return NO;
}
@end
@interface GHAttributesLabel()<UITextViewDelegate>
@property (nonatomic , strong) GHTextView *textView ;
@property (nonatomic , copy) NSString *actionTest ;

@end
@implementation GHAttributesLabel

- (void)setAttributesText: (NSMutableAttributedString *)text actionText: (NSString *)actionText {
    self.textView.attributedText = text;
    self.actionTest = actionText;
}


- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction  {
    if ([textView.text containsString:self.actionTest]) {
        
        if (self.actionBlock) {
            self.actionBlock();
        }
        return NO;
    }

    return YES;
}

- (instancetype)init {
    if (self == [super init]) {
        [self setupUI];
        [self configuration];

    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setupUI];
        [self configuration];
    }
    return self;
}
- (void)configuration {
    self.userInteractionEnabled = YES;
}
- (void)setupUI {
    [self addSubview:self.textView];
}
- (void)layoutSubviews {
    self.textView.frame = self.bounds;
}

- (GHTextView *)textView {
    if (_textView == nil) {
        _textView = [[GHTextView alloc]init];
        _textView.backgroundColor = self.backgroundColor;
        _textView.textColor = self.textColor;
        self.textColor = [UIColor clearColor];
        _textView.font = self.font;
        _textView.scrollEnabled = NO;
        _textView.text = self.text;
        _textView.delegate = self;
        _textView.editable = NO;
        _textView.textAlignment = self.textAlignment;
    }
    return _textView;
}



@end

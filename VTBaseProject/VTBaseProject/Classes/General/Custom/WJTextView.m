//
//  WJTextView.m
//  DengGaoYunShan
//
//  Created by lianjie on 2017/11/16.
//  Copyright © 2017年 lianjie. All rights reserved.
//

#import "WJTextView.h"

@implementation WJTextView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
     
        ///设置默认字体
        self.font = [UIFont systemFontOfSize:15.f];
        
        ///设置默认颜色
        self.placeholderColor = [UIColor grayColor];
        
        ///使用通知监听文字改变
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange:) name:UITextViewTextDidChangeNotification object:self];
        
    }
    return self;
}

-(void)textDidChange:(NSNotification *)note
{
    ///重新调用drawRect：方法
    
    [self setNeedsDisplay];
    
}

///删除监听对象
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


///每次调用drawRect：方法，都会将以前画的东西清除掉
-(void)drawRect:(CGRect)rect
{
    ///如果有文字，就直接返回，不需要画占位文字
    if (self.hasText) {
        return;
    }
    
    ///属性设置
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    
    attributes[NSFontAttributeName] = self.font;
    
    attributes[NSForegroundColorAttributeName] = self.placeholderColor;
    
    ///文字
    rect.origin.x = 5;
    rect.origin.y = 8;
    
    rect.size.width -= 2*rect.origin.x;
    
    [self.placeholder drawInRect:rect withAttributes:attributes];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setNeedsDisplay];
}


#pragma mark ---setter
-(void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = [placeholder copy];
    
    [self setNeedsDisplay];
}

-(void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderColor = placeholderColor;
    
    [self setNeedsDisplay];
}

-(void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    [self setNeedsDisplay];
}

-(void)setText:(NSString *)text
{
    [super setText:text];
    [self setNeedsDisplay];
}

-(void)setAttributedText:(NSAttributedString *)attributedText
{
    [super setAttributedText:attributedText];
    
    [self setNeedsDisplay];
}

@end

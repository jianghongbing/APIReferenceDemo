//
//  ViewController.m
//  NSAttributedString
//
//  Created by pantosoft on 2017/6/29.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSAttributedString:用于富文本的显示,给其中的字符串加上不同的特性,eg:颜色,字体大小,字体等,不可变
    //1.NSAttributedString的创建
//    NSAttributedString *attributeString = [[NSAttributedString alloc] initWithString:@"jianghongbing"];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor redColor];
    shadow.shadowOffset = CGSizeMake(2, 3);
    shadow.shadowBlurRadius = 2;
    
    NSDictionary *attributes = @{ NSFontAttributeName: [UIFont systemFontOfSize:25], //设置字体大小
                                  NSForegroundColorAttributeName: [UIColor orangeColor], //设置字体显示的颜色
                                  NSBackgroundColorAttributeName: [UIColor grayColor], //设置字体的背景色
//                                  NSParagraphStyleAttributeName: 设置段落样式,值为NSParagraphStyle
                                  NSLigatureAttributeName: @5,
                                  NSKernAttributeName: @4, //设置字符之间的间距
                                  NSStrikethroughStyleAttributeName: @(NSUnderlineStyleSingle), //设置删除线线,并设置删除线的样式
                                  NSStrikethroughColorAttributeName: [UIColor redColor], //设置删除线的颜色
                                  NSUnderlineStyleAttributeName: @(NSUnderlinePatternDashDot), //设置下划线
                                  NSUnderlineColorAttributeName: [UIColor yellowColor], //设置下划线的颜色
                                  
                                  NSStrokeColorAttributeName: [UIColor greenColor], //设置字体的显示的颜色
                                  NSStrokeWidthAttributeName: @5,//绘制的宽度
                                  
                                  NSShadowAttributeName:shadow, //设置阴影
                                  NSTextEffectAttributeName: NSTextEffectLetterpressStyle, //设置effectLetterPress效果
//                                  NSAttachmentAttributeName:  附件
                                  NSLinkAttributeName:[NSURL URLWithString:@"https://github.com"],//设置链接
//                                  NSBaselineOffsetAttributeName: @5, //基线的偏移值,正数上偏,负数下偏
//                                  NSObliquenessAttributeName: @1.0, //文字倾斜
//                                  NSExpansionAttributeName: @(-0.5), //拉升和压缩为本,正数为膨胀,负数为压缩文本
//                                  NSWritingDirectionAttributeName:@[@(NSWritingDirectionRightToLeft),@(NSWritingDirectionRightToLeft)], //文字输入方向
//                                  NSVerticalGlyphFormAttributeName:@1, //设置文本是水平显示还是垂直显示,iOS上只有水平显示,不支持垂直显示文字
                                 };
    
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:@"jianghongbing" attributes:attributes];
    
    
    //2.获取attributeString的长度和string
    NSString * string = attributedString.string;
    NSInteger length = attributedString.length;
    NSLog(@"string:%@, length:%ld", string, length);
    
    //3.获取指定位置的对应特性的值,attribute:特性的名称
    NSRange range;
    id attributeValue = [attributedString attribute:NSForegroundColorAttributeName atIndex:3 effectiveRange:&range];
    NSLog(@"attributeValue:%@,range:%@", attributeValue, NSStringFromRange(range));
    
    //4.获取指定range的attributedString
    NSAttributedString *rangeAttributedString = [attributedString attributedSubstringFromRange:NSMakeRange(2, 5)];
    
    //5.获取指定位置的字符的所有特性
    
    NSDictionary *rangeAttributes = [attributedString attributesAtIndex:10 longestEffectiveRange:&range inRange:NSMakeRange(2, 7)];
    NSLog(@"attributeValue:%@,range:%@", rangeAttributes, NSStringFromRange(range));
    
    //6.获取指定位置的字符的对应特性的值
    attributeValue = [attributedString attribute:NSFontAttributeName atIndex:4 longestEffectiveRange:nil inRange:NSMakeRange(0, 20)];
    NSLog(@"attributeValue:%@", attributeValue);
    
    //7.NSAttributedString的比较
    BOOL isEqual = [rangeAttributedString isEqualToAttributedString:attributedString];
    NSLog(@"isEqual:%d", isEqual);
    //8.遍历指定range范围内的所有attrbute value
    [attributedString enumerateAttributesInRange:NSMakeRange(0, 10) options:NSAttributedStringEnumerationReverse usingBlock:^(NSDictionary<NSString *,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
        NSLog(@"attrs:%@, range:%@", attrs, NSStringFromRange(range));
    }];
    
    //9.遍历指定range范围内的指定attribute名称的值
    [attributedString enumerateAttribute:NSForegroundColorAttributeName inRange:NSMakeRange(2, 2) options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(id  _Nullable value, NSRange range, BOOL * _Nonnull stop) {
        NSLog(@"value:%@, range:%@", value, NSStringFromRange(range));
    }];
    
    
    self.textLabel.font = [UIFont systemFontOfSize:16];
    self.textLabel.textColor = [UIColor redColor];
    self.textLabel.attributedText = attributedString;
    self.textLabel.userInteractionEnabled = YES;
//    self.textLabel.text = attributedString.string;
    
    self.textField.font = [UIFont systemFontOfSize:15];
    self.textField.textColor = [UIColor blueColor];
    self.textField.attributedText = rangeAttributedString;
//    self.textField.text = attributedString.string;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.textField.isFirstResponder) {
        [self.textField resignFirstResponder];
    }
}

@end

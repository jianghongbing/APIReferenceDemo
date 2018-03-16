//
//  TableViewController.m
//  UIFont
//
//  Created by pantosoft on 2018/3/15.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdLabel;
@property (weak, nonatomic) IBOutlet UILabel *fourthLabel;
@property (weak, nonatomic) IBOutlet UILabel *fifthLabel;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.字体的创建
    //优先字体的创建
        UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    //创建兼容某种环境的字体
//    preferredFont = [UIFont preferredFontForTextStyle:UIFontTextStyleTitle1 compatibleWithTraitCollection:nil]
    //    UIFontTextStyleLargeTitle:大标题样式
    //    UIFontTextStyleTitle1:标题1样式
    //    UIFontTextStyleTitle2:标题2样式
    //    UIFontTextStyleTitle3:标题3样式
    //    UIFontTextStyleHeadline:主标题样式
    //    UIFontTextStyleSubheadline:副标题样式
    //    UIFontTextStyleBody:正文字体样式
    //    UIFontTextStyleCallout:插图编号字体样式
    //    UIFontTextStyleFootnote:脚注字体样式
    //    UIFontTextStyleCaption1:说明字体1样式
    //    UIFontTextStyleCaption2:说明字体2样式
    //通过字体名称来创建字体,size必须大于0
//    font = [UIFont fontWithName:@"" size:14];
    //依据标准用户界面来创建字体
    font = [UIFont systemFontOfSize:15.0];
    //粗体
    UIFont *boldSystemFont = [UIFont boldSystemFontOfSize:15.0];
    //斜体
    UIFont *italicSystemFont = [UIFont italicSystemFontOfSize: 15.0];
    self.firstLabel.font = font;
    self.secondLabel.font = boldSystemFont;
    self.thirdLabel.font = italicSystemFont;
    //通过fontWeigth来创建字体
    font = [UIFont systemFontOfSize:15.0 weight:10];
    self.fourthLabel.font = font;
    //等宽字体
    font = [UIFont monospacedDigitSystemFontOfSize:15.0 weight:10];
    self.fifthLabel.font = font;
    //通过UIFontDescriptor来构建字体
    //    font = [UIFont fontWithDescriptor:nil size:15];
    font = [UIFont systemFontOfSize:15.0];
    //2.字体的相关属性
    NSString *familyName = font.familyName; //字体家族名称
    NSString *fontName = font.fontName; //字体名称
    CGFloat pointSize = font.pointSize; //字体大小
    CGFloat ascender = font.ascender; //从基线往上,最大的偏移量,字体的头部距离基线的距离
    CGFloat descender = font.descender; //从基线往下,最大的偏移量,字体的底部距离基线的距离
    CGFloat capHeight = font.capHeight; //大写字母高度
    CGFloat xHeight = font.xHeight; //小写字母x的高度
    CGFloat lineHeight = font.lineHeight; //字体行高
    CGFloat leading = font.leading; //行距
    NSLog(@"familyName:%@\nfontName:%@\npointSize:%f\nascender:%f\ndescender:%f\ncapHeight:%f\nxHeight:%f\nlineHeight:%f\nleading:%f", familyName, fontName, pointSize, ascender, descender, capHeight, xHeight, lineHeight, leading);

    //创建一个和自己除了fontSize不一样,其他信息都一样的字体
    UIFont *newFont = [font fontWithSize:18];
    NSLog(@"newFont:%@", newFont);
    
    //获取字体的描述
    UIFontDescriptor *fontDescriptor = newFont.fontDescriptor;
    NSLog(@"fontDescriptor:%@", fontDescriptor);

}
@end

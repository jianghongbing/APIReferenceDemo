//
//  ManageTextStorageViewController.m
//  NSLayoutManager
//
//  Created by pantosoft on 2019/5/8.
//  Copyright © 2019 jianghongbing. All rights reserved.
//

#import "BasicDemoViewController.h"

@interface BasicDemoViewController ()
//@property (nonatomic, strong) NSArray *stringList;
//@property (nonatomic, strong) NSArray *colors;
@end



@implementation BasicDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"textStorage:%@, textContainer:%@, layoutManager:%@", self.textView.textStorage, self.textView.textContainer, self.textView.layoutManager);
}

//- (NSArray *)stringList {
//    if (_stringList == nil) {
//        _stringList = @[
//                        @"渡汉江--岭外音书断, 经冬复历春. 近乡情更怯, 不敢问来人.",
//                        @"凉州词--葡萄美酒夜光杯, 欲饮琵琶马上催. 醉卧沙场君莫笑, 古来征战几人回?",
//                        @"枫桥夜泊--月落乌啼霜满天, 江枫渔火对愁眠. 姑苏城外寒山寺. 夜半钟声到客船.",
//                        ];
//    }
//    return _stringList;
//}
//
//- (NSArray *)colors {
//    if (_colors == nil) {
//        _colors = @[[UIColor redColor], [UIColor greenColor], [UIColor blueColor]];
//    }
//    return _colors;
//}
//
//
//- (IBAction)replaceANewTextStorage:(id)sender {
//    if (self.textView.isFirstResponder) {
//        [self.textView resignFirstResponder];
//    }
//
//    NSString *text = self.stringList[arc4random() % 3];
//    UIColor *textColor = self.colors[arc4random() % 3];
//
//    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithString:text attributes:@{NSForegroundColorAttributeName: textColor}];
//    [self.textView.textStorage removeLayoutManager:self.textView.layoutManager];
//    [textStorage addLayoutManager:self.textView.layoutManager];
//}

@end

//
//  main.m
//  NSCharacterSet
//
//  Created by jianghongbing on 2017/6/4.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSCharacterset是一些unicode字符的集合,常于NSScanner和NSString配合使用
        //1.NSCharacterSet的创建,
        //1.1通过类族提供的方式来获取特定的character set
        /**
         1.控制符
         @property (readonly, class, copy) NSCharacterSet *controlCharacterSet;
         2.空白符
         @property (readonly, class, copy) NSCharacterSet *whitespaceCharacterSet;
         3.空白和换行符
         @property (readonly, class, copy) NSCharacterSet *whitespaceAndNewlineCharacterSet;
         4.数字字符
         @property (readonly, class, copy) NSCharacterSet *decimalDigitCharacterSet;
         5.字母字符
         @property (readonly, class, copy) NSCharacterSet *letterCharacterSet;
         6.小写的字母字符
         @property (readonly, class, copy) NSCharacterSet *lowercaseLetterCharacterSet;
         7.大写的字母字符
         @property (readonly, class, copy) NSCharacterSet *uppercaseLetterCharacterSet;
         8.非基本字符
         @property (readonly, class, copy) NSCharacterSet *nonBaseCharacterSet;
         9.字母数字字符
         @property (readonly, class, copy) NSCharacterSet *alphanumericCharacterSet;
         10.
         @property (readonly, class, copy) NSCharacterSet *decomposableCharacterSet;
         11.非法字符
         @property (readonly, class, copy) NSCharacterSet *illegalCharacterSet;
         12.标点符号字符
         @property (readonly, class, copy) NSCharacterSet *punctuationCharacterSet;
         13.第一个字母大写的字符
         @property (readonly, class, copy) NSCharacterSet *capitalizedLetterCharacterSet;
         14.符号字符
         @property (readonly, class, copy) NSCharacterSet *symbolCharacterSet;
         15.换行符
         @property (readonly, class, copy) NSCharacterSet *newlineCharacterSet
         */
//        NSCharacterSet *whitespaceCharacterSet = [NSCharacterSet whitespaceCharacterSet]; //包含空白符的char set
        //1.2.通过字符的范围来创建NSCharacterSet
        NSUInteger location = (unsigned short)'a';
        NSUInteger lenth = 26;
        NSRange range = NSMakeRange(location, lenth);
        NSCharacterSet *rangeCharacterSet = [NSCharacterSet characterSetWithRange:range];
        //1.3 通过给定的字符串来创建NSCharacterSet
        NSCharacterSet *stringCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@"jiang234"];
        //1.4 其他创建方式
//        NSCharacterSet *fileCharacterSet = [NSCharacterSet characterSetWithContentsOfFile:<#(nonnull NSString *)#>]
//        NSCharacterSet *bitmapCharacterSet = [NSCharacterSet characterSetWithBitmapRepresentation:<#(nonnull NSData *)#>]

        //2.NSCharacterSet的一些常见方法
        //2.1判断某个字符是否在char set中
        BOOL isMember = [stringCharacterSet characterIsMember:'j'];
        NSLog(@"isMember:%d", isMember);
        isMember = [rangeCharacterSet characterIsMember:'a' + 10];
        NSLog(@"isMember:%d", isMember);
        //2.2.获取 bitmapRepresentation
//        NSData *bitmapRepresentation = [whitespaceCharacterSet bitmapRepresentation];
        //2.3 获取字符翻转过来的char set
//        NSCharacterSet *invertedCharacterSet = stringCharacterSet.invertedSet;
        //2.4 判断long character 是否在set中 32位的字符
        isMember = [stringCharacterSet longCharacterIsMember:'2'];
        //2.5判断一个char set是否包含另外一个char set
        NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"jiang"];
        BOOL isSuper = [stringCharacterSet isSupersetOfSet:characterSet];
        NSLog(@"isSuper:%d", isSuper);
        // has member in palne
//        BOOL hasMember = [stringCharacterSet hasMemberInPlane:'g'];
//        NSLog(@"hasMember:%d", hasMember);

        //3 NSMutableCharacterSet的常见方法
        NSMutableCharacterSet *mutableCharaecterSet = [NSMutableCharacterSet characterSetWithCharactersInString:@""];
        //3.1 通过range来添加字符
        [mutableCharaecterSet addCharactersInRange:NSMakeRange(0, 20)];
        //3.2 通过range来移除字符
        [mutableCharaecterSet removeCharactersInRange:NSMakeRange(10, 10)];
        //3.3 通过字符串来添加字符
        [mutableCharaecterSet addCharactersInString:@"jianghongbing"];
        //3.4 通过移除指定字符串中的字符
        [mutableCharaecterSet removeCharactersInString:@"jiang"];
        //3.5 和另外一个char set的并集
        [mutableCharaecterSet formUnionWithCharacterSet:stringCharacterSet];
        //3.6 和另外一个char set的交集
        [mutableCharaecterSet formIntersectionWithCharacterSet:stringCharacterSet];
        //3.7 翻转char set
        [mutableCharaecterSet invert];

        //4.NSCharacterSet的常见用法
        NSString *testString = @"  \njiang hong bing \n   ";
        NSLog(@"testString:%@",testString);
        NSCharacterSet *charSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        //去掉收尾的空白符和换行符
        NSString *trimmingString = [testString stringByTrimmingCharactersInSet:charSet];
        NSLog(@"trimingString:%@", trimmingString);
        NSArray *strComponents = [trimmingString componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        NSString *finalStr = [strComponents componentsJoinedByString:@""];
        NSLog(@"finalStr:%@", finalStr);
    }
    return 0;
}

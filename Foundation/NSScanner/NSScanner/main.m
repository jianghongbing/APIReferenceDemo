//
//  main.m
//  NSScanner
//
//  Created by jianghongbing on 2017/6/4.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
void scanInt(void);
void scanFloat(void);
void scanString(void);
void scanUpToCharacterSet(void);
void scanUpToString(void);
BOOL isAllDigitalNumberInString(NSString *string);
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        NSScanner *scanner = [[NSScanner alloc] initWithString:@"jiang123hong4.5bing"];
//        NSCharacterSet *skippedCharSet = [NSCharacterSet characterSetWithCharactersInString:@"jiang"];
////        设置跳过扫描的char set
//        scanner.charactersToBeSkipped = skippedCharSet;
////         是否区分大小写
//        scanner.caseSensitive = NO;
////        设置开始扫描的位置,每一次扫描,默认会从已经扫描到的位置开始扫描,不会从0又开始扫描,但是可以手动设置scanLocation的值,scanLocation的值不能超过字符串的长度,一旦扫描
//        scanner.scanLocation = 0;

        /**
         NSScanner扫描的规则
         1.默认会从第一个字符开始扫描,当然也可以通过scanLocation来设置,下一次扫描的位置会从上次扫描结束的位置开始,但是也可以通过scanLocation来重新设置
         2.如果扫描到不匹配的位置,会停止扫描,如果scan的结果为true则表示发现到了想要扫描的值,否则则一开始就不匹配而停止扫描,不会强制扫描到最后一个字符
         3.scanUpToString和scanUpFromSet则和上面的不同,会一直扫描,如果发现匹配的结果就停止,如果没有发现就扫描完整个字符串而停止
         */
        scanInt();
        scanFloat();
        scanString();
        scanUpToCharacterSet();
        scanUpToString();

        //判断一个字符串中是否全部由数字组成
        BOOL isAllDigital = isAllDigitalNumberInString(@"2334.323");
        if (isAllDigital) {
            NSLog(@"该字符串都是由数字组成");
        }else {
            NSLog(@"该字符串不全部都有字符串组成");
        }
        isAllDigital = isAllDigitalNumberInString(@"2323j32");
        if (isAllDigital) {
            NSLog(@"该字符串都是由数字组成");
        }else {
            NSLog(@"该字符串不全部都有字符串组成");
        }
        isAllDigital = isAllDigitalNumberInString(@"234\n12");
        if (isAllDigital) {
            NSLog(@"该字符串都是由数字组成");
        }else {
            NSLog(@"该字符串不全部都有字符串组成");
        }
        isAllDigital = isAllDigitalNumberInString(@"0123243243");
        if (isAllDigital) {
            NSLog(@"该字符串都是由数字组成");
        }else {
            NSLog(@"该字符串不全部都有字符串组成");
        }

    }
    return 0;
}

void scanInt() {
    NSString *scanString = @"jiang123hongbing";
    NSScanner *scanner = [NSScanner scannerWithString:scanString];
    NSCharacterSet *skippedCharectrSet = [NSCharacterSet characterSetWithCharactersInString:@"jiang"];
    scanner.charactersToBeSkipped = skippedCharectrSet;
    scanner.scanLocation = 0;
    int scanResult;
    BOOL scanSuccess = [scanner scanInt:&scanResult];
    if (scanSuccess) {
        NSLog(@"intResult:%d", scanResult);
    }else {
        NSLog(@"scan failed");
    }

    //扫描的位置
    NSUInteger scanLocation = scanner.scanLocation;
    NSLog(@"scanLocation:%ld", scanLocation);
//
//    while (!scanner.isAtEnd) {
//        [scanner scanInt:&scanResult];
////        NSLog(@"intResult:%d", scanResult);
//        NSUInteger scanLocation = scanner.scanLocation;
//        NSLog(@"scanLocation:%ld", scanLocation);
//
//    }


}

void scanString() {
    NSString *scanString = @"jianghong234bing345";
    NSScanner *scanner = [NSScanner scannerWithString:scanString];
    NSString *scanResult;

//    BOOL scanSuccess = [scanner scanString:@"jianghong234bing345" intoString:&scanResult];
//    if (scanSuccess) {
//        NSLog(@"scannerResult:%@", scanResult);
//    }else {
//        NSLog(@"scan failed");
//    }

    while (!scanner.isAtEnd) {
        BOOL scanSuccess = [scanner scanString:@"hong" intoString:&scanResult];
        if (scanSuccess) {
            NSLog(@"scannerResult:%@", scanResult);
            break;
        }else {
            NSLog(@"scan failed");
        }
        NSLog(@"scanLocation:%ld",scanner.scanLocation);
        scanner.scanLocation++;
    }
}


void scanFloat() {
    NSScanner *scanner = [NSScanner scannerWithString:@"5jiang6.4ho"];
    float result;
    BOOL scanSuccess = [scanner scanFloat:&result];
    if (scanSuccess) {
        NSLog(@"result:%f", result);
    }
}
void scanUpToCharacterSet() {
    NSScanner *scanner = [NSScanner scannerWithString:@"234jiang3.4hongbing"];

    NSMutableCharacterSet *mutableCharSet = [NSMutableCharacterSet characterSetWithCharactersInString:@"abc"];
//    NSCharacterSet *charSet = [NSCharacterSet decimalDigitCharacterSet];
//    [mutableCharSet formUnionWithCharacterSet:charSet];

    NSString *result;

    //scan到符合条件的字符(任意一个在char set中的字符,不需要全部匹配)就停止,并将该字符之前的字符串写入result里面,如果都没有匹配到,会将整个字符串写入result.
    BOOL scanSuccess = [scanner scanUpToCharactersFromSet:mutableCharSet intoString:&result];
    if (scanSuccess) {
        NSLog(@"result:%@",result);
    }else {
        NSLog(@"scan failed");
    }
}

void scanUpToString() {
    NSScanner *scanner = [NSScanner scannerWithString:@"234jiang3.4hongbing"];
    NSString *scanString = @"ing";

    NSString *result;

    //scan到符合条件的字符串就停止,并将该字符之前的字符串写入result里面,如果扫描到最后一个都没有匹配到,会将整个字符串写入result.可以通过和isAtEnd配合使用,来判断字符串中是否有匹配的值
    BOOL scanSuccess = [scanner scanUpToString:scanString intoString:&result];
    if (scanSuccess && !scanner.isAtEnd) {
        NSLog(@"result:%@",result);
    }else {
        NSLog(@"scan failed");
    }
}

BOOL isAllDigitalNumberInString(NSString *string) {
    if (string == nil  || string.length == 0) {
        return NO;
    }
    NSString *temp = string;
    NSScanner *scanner = [NSScanner scannerWithString:temp];
    NSCharacterSet *numberCharSet = [NSCharacterSet decimalDigitCharacterSet];
    scanner.charactersToBeSkipped = numberCharSet;
    scanner.caseSensitive = NO;
    NSMutableCharacterSet *scanCharSet = [NSMutableCharacterSet letterCharacterSet];
    [scanCharSet formUnionWithCharacterSet:[NSCharacterSet symbolCharacterSet]];
    [scanCharSet formUnionWithCharacterSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    [scanCharSet formUnionWithCharacterSet:[NSCharacterSet punctuationCharacterSet]];
    [scanCharSet formUnionWithCharacterSet:[NSCharacterSet controlCharacterSet]];

    NSString *result = nil;
    BOOL scanSuccess = [scanner scanCharactersFromSet:scanCharSet intoString:&result];
//    BOOL scanSuccess = [scanner scanUpToCharactersFromSet:scanCharSet intoString:&result];
    return !result && !scanSuccess;
}

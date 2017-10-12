//
//  main.m
//  NSLocale
//
//  Created by pantosoft on 2017/10/12.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSLocale:表示一个地方,在需要做本地化或者格式化处理的时候,会常用到NSLocale
        //1.获取所有系统可用的localeIdentifier
        NSArray *availableLocaleIdentifiers = [NSLocale availableLocaleIdentifiers];
        [availableLocaleIdentifiers enumerateObjectsUsingBlock:^(NSString *localeIdentifier, NSUInteger idx, BOOL *stop) {
            NSLog(@"localeIdentifier:%@", localeIdentifier);
        }];
        //2.获取语言编码
        NSArray *ISOLanguageCodes = [NSLocale ISOLanguageCodes];
        //3.获取国家编码
        NSArray *ISOCountryCodes = [NSLocale ISOCountryCodes];
        //4.获取货币编码
        NSArray *ISOCurrencyCodes = [NSLocale ISOCurrencyCodes];
        //5.获取通用货币编码
        NSArray *commonISOCurrencyCodes = [NSLocale commonISOCurrencyCodes];
        for (NSString *languageCode in ISOLanguageCodes) {
            NSLog(@"languageCode:%@", languageCode);
        }
        for (NSString *countryCode in ISOCountryCodes) {
            NSLog(@"countryCode:%@", countryCode);
        }
        for (NSString *currencyCode in ISOCurrencyCodes) {
            NSLog(@"currencyCode:%@", currencyCode);
        }
        for (NSString *commonCurrencyCode in commonISOCurrencyCodes) {
            NSLog(@"commonCurrencyCode:%@", commonCurrencyCode);
        }
        //6.获取用户偏好语言列表
        NSArray *preferredLanguages = [NSLocale preferredLanguages];
        for (NSString *preferredLanguage in preferredLanguages) {
            NSLog(@"preferredLanguage:%@", preferredLanguage);
        }
    }
    return 0;
}

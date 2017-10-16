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
        
        //7.获取locale的components
        NSDictionary *dictionary = [NSLocale componentsFromLocaleIdentifier:@"CN"];
        [dictionary enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *value, BOOL *stop) {
            NSLog(@"key:%@,value:%@", key, value);
        }];
        //8.根据components获取locale identifier
        NSString *localeIdentifier = [NSLocale localeIdentifierFromComponents:dictionary];
        NSLog(@"localeIdentifier:%@", localeIdentifier);
        //9.获取标准的localeIdentifier和localeLanguageIdentifier
        NSString *canonicalLocaleIdentifier = [NSLocale canonicalLocaleIdentifierFromString:@"cn"];
        NSString *canonicalLocaleLanguageIdentifier = [NSLocale canonicalLanguageIdentifierFromString:@"cn"];
        NSLog(@"canonicalLocaleIdentifier:%@,canonicalLocaleLanguageIdentifier:%@", canonicalLocaleIdentifier, canonicalLocaleLanguageIdentifier);
        //10.获取当前locale
        NSLocale *currentLocale = [NSLocale currentLocale];
        NSLog(@"currentLocale:%@", currentLocale);
        //11.获取locale对应localeKey的值,可以参考NSLocalKey的所有的值
        NSString *identifier = [currentLocale objectForKey:NSLocaleIdentifier];
        NSString *languageCode = [currentLocale objectForKey:NSLocaleLanguageCode];
        NSString *countryCode = [currentLocale objectForKey:NSLocaleCountryCode];
        NSString *scriptCode = [currentLocale objectForKey:NSLocaleScriptCode];
        NSLog(@"identifier:%@,languageCode:%@,countryCode:%@,scriptCode:%@", identifier, languageCode, countryCode, scriptCode);
        //12.获取systemLocale
        NSLocale *systemLocale = [NSLocale systemLocale];
        identifier = [systemLocale objectForKey:NSLocaleIdentifier];
        languageCode = [systemLocale objectForKey:NSLocaleLanguageCode];
        countryCode = [systemLocale objectForKey:NSLocaleCountryCode];
        scriptCode = [systemLocale objectForKey:NSLocaleScriptCode];
        NSLog(@"identifier:%@,languageCode:%@,countryCode:%@,scriptCode:%@", identifier, languageCode, countryCode, scriptCode);
    }
    return 0;
}

//
//  ViewController.m
//  NSBundle
//
//  Created by pantosoft on 2017/7/17.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.获取程序的mainBundle, mainBundle主要储存程序的资源文件
    NSBundle *mainBundle = [NSBundle mainBundle];
    //bundle的属性
    //2.获取bundle所在的位置NSURL
    NSURL *bundleURL = mainBundle.bundleURL; //bundle所在的位置
    NSURL *resourceURL = mainBundle.resourceURL; //资源文件所在的位置
    NSURL *excutableURL = mainBundle.executableURL; //可执行程序所在的位置
    NSURL *auxiliaryExecutableURL = [mainBundle URLForAuxiliaryExecutable:@"NSBundle"]; //获取bundle指定的可执行文件的位置,如果不存指定的可执行文件则为nil
    NSLog(@"bundleURL:%@\nresourceURL:%@\nexcutableURL:%@,auxiliaryExecuteableURL:%@", bundleURL, resourceURL, excutableURL, auxiliaryExecutableURL);

    NSURL *privateFrameworksURL = mainBundle.privateFrameworksURL;
    NSURL *sharedFrameworksURL = mainBundle.sharedFrameworksURL;
    NSURL *sharedSupportURL = mainBundle.sharedSupportURL;
    NSURL *builtInPlugInsURL = mainBundle.builtInPlugInsURL;
    NSLog(@"privateFrameworksURL:%@\nsharedFrameworksURL:%@\nsharedSupportURL:%@\nbuiltInPlugInsURL:%@", privateFrameworksURL.absoluteURL, sharedFrameworksURL.absoluteURL, sharedSupportURL.absoluteURL, builtInPlugInsURL.absoluteURL);

    //3.获取bundle所在的位置Path
    NSString *bundlePath = mainBundle.bundlePath;
    NSString *resourcePath = mainBundle.resourcePath;
    NSString *excutablePath = mainBundle.executablePath;
    NSString *auxiliaryExecutablePath = [mainBundle pathForAuxiliaryExecutable:@"NSBundle"];
    NSLog(@"bundlePath:%@\nresourcePath:%@\nexcutablePath:%@\nauxiliaryExecutablePath:%@", bundlePath, resourcePath, excutablePath,auxiliaryExecutablePath);
    NSString *privateFrameworksPath = mainBundle.privateFrameworksPath;
    NSString *sharedFrameworksPath = mainBundle.sharedFrameworksPath;
    NSString *sharedSupportPath = mainBundle.sharedSupportPath;
    NSString *builtInPlugInsPath = mainBundle.builtInPlugInsPath;
    NSLog(@"privateFrameworksPath:%@\nsharedFrameworksPath:%@shareSupportPath:%@\nbuiltInPlugInsPath:%@", privateFrameworksPath, sharedFrameworksPath, sharedSupportPath, builtInPlugInsPath);

    //4.获取bundle信息
    NSString *bundleIdentifier = mainBundle.bundleIdentifier;
    NSLog(@"bundleIdentifier:%@", bundleIdentifier);
    NSDictionary *bundleInfo = mainBundle.infoDictionary;
    [bundleInfo enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSLog(@"%@:%@", key, obj);
    }];

//    NSDictionary *localizedInfo = mainBundle.localizedInfoDictionary;
    //4.1获取bundle指定key的值
    id bundleName = [mainBundle objectForInfoDictionaryKey:@"CFBundleName"];
    NSLog(@"bundleName:%@", bundleName);

    //
    NSString *principalClass = NSStringFromClass(mainBundle.principalClass);
    NSLog(@"principalClass:%@", principalClass);

    //5.获取本地化信息
    NSArray *localizations = mainBundle.localizations;
    for (NSString *locallization in localizations) {
        NSLog(@"locallization:%@", locallization);
    }

    localizations = mainBundle.preferredLocalizations;
    for (NSString *preferredLocalization in localizations) {
        NSLog(@"preferredLocalization:%@", preferredLocalization);
    }
    NSLog(@"developmentLocalization:%@", mainBundle.developmentLocalization);

    //6.获取bundle中的文件的资源,如果不存在就为null
    NSString *textFilePath = [mainBundle pathForResource:@"text" ofType:@"txt"];
    NSString *text = [NSString stringWithContentsOfFile:textFilePath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"textFilePath:%@, text:%@", textFilePath, text);

    //7.获取bundle中的文件夹中的资源
    NSString *subPath = [mainBundle pathForResource:@"Source" ofType:nil];
    NSString *imagePath = [mainBundle pathForResource:@"4.jpg" ofType:nil inDirectory:subPath];
    NSLog(@"imagePath:%@", imagePath);
    //8.获取本地化的资源的路径
//    NSString *localizationSourcePath = [mainBundle pathForResource:@"5" ofType:@"jpg" inDirectory:subPath forLocalization:@"en"];
//    NSString

    //9.获取相同类型的资源文件位置
    NSArray *sourcesPath = [mainBundle pathsForResourcesOfType:@"jpg" inDirectory:subPath];
    for (NSString *path in sourcesPath) {
        NSLog(@"path:%@", path);
    }

    //10.也可以通过URL的形式来访问bundle中的资源,使用方式基本相同


    //11.其他形式的bundle的获取
//    NSBundle *bundle = [NSBundle bundleForClass:@""];
//    bundle = [NSBundle bundleWithURL:@""];
//    bundle = [NSBundle bundleWithPath:@""];
//    bundle = [NSBundle bundleWithIdentifier:@""];
//    bundle = [[NSBundle alloc] initWithPath:@""];
//    bundle = [[NSBundle alloc] initWithURL:@""];


    //12.获取所用的bundle
    NSArray *bundles = [NSBundle allBundles];
    for (NSBundle *bundle in bundles) {
        NSLog(@"bundle:%@", bundle);
    }
    //13.获取所有的frameworks
    NSArray *frameworks = [NSBundle allFrameworks];
    NSLog(@"frameworks:%@" ,frameworks);

    //14.myBundle
    NSString *myBundlePath = [[NSBundle mainBundle] pathForResource:@"myBundle" ofType:@"bundle"];
    NSBundle *myBundle = [NSBundle bundleWithPath:myBundlePath];
    NSLog(@"myBundle:%@", myBundle);

    //15.load & unload bundle
    if (!myBundle.isLoaded) {
        [myBundle load];
        NSLog(@"myBundle:%@", myBundle);
    }

    if (myBundle.isLoaded) {
        [myBundle unload];
        NSLog(@"myBundle:%@", myBundle);
    }

}

@end

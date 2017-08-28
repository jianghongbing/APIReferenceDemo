//
//  ViewController.m
//  NSStringPathExtensions
//
//  Created by pantosoft on 2017/8/28.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //常见目录的获取
    //1.获取app的主目录,主目录下面默认包含Documents,Library,tmp三个文件夹,其中Library有Caches和Preferences目录
    NSString *homeDirectory = NSHomeDirectory();
    NSLog(@"homeDirectory:%@", homeDirectory);
    //2.获取临时文件存放目录,每次app退出的时候,该目录的文件会自动清除
    NSString *tempDirectory = NSTemporaryDirectory();
    NSLog(@"tempDirectory:%@", tempDirectory);
    //3.获取Documents文件夹目录,Library目录,Cache目录
    NSArray *documentsDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = documentsDirectories.firstObject;
    
    NSArray *libraryDirectories = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = libraryDirectories.lastObject;
    
    NSArray *cacheDirectories = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cacheDiretory = cacheDirectories.firstObject;
    
    NSLog(@"countOfDocumentsDirectories:%ld,documentDirectory:%@,countOfLibraryDirectories:%ld,libraryDirectory:%@, cachesDirectory:%@", documentsDirectories.count, documentsDirectory, libraryDirectories.count,libraryDirectory, cacheDiretory);
    //4.Preferences目录:一般不直接存放文件到Preferences目录中,一般通过NSUserDefaults来存放一些简单的数据到Preferences中
    //5.其他相关的路径(iOS很少用,一般用于mac os 中)
    NSString *userName = NSUserName(); //获取用户名称
    NSString *fullUserName = NSFullUserName(); //获取用户全名
    NSString *userDirectory = NSHomeDirectoryForUser(userName); //获取用户的主目录
    NSString *userRootDirectory = NSOpenStepRootDirectory(); //获取用户的更目录
    NSLog(@"userName:%@, fullUserName:%@, userDirectory:%@,userRootDirectory:%@", userName, fullUserName, userDirectory, userRootDirectory);
    //6.NSSearchPathDirectory:在指定的目录中搜索,常见的搜索目录:NSDocumentDirectory,NSLibraryDirectory,NSCachesDirectory
    //7.NSSearchPathDomainMask:在指定的域中搜索,常用的域:NSUserDomainMask当前用户的域
    //NSLocalDomainMask当前主机的域, NSNetworkDomainMask:本地局域网的域,NSSystemDomainMask:系统域,NSAllDomainsMask:所有域
    
    
    //对某个文件path的一些常用操作
    //8.获取path的所有components
    NSArray *pathComponents = [documentsDirectory pathComponents];
    for (NSString *component in pathComponents) {
        NSLog(@"component:%@", component);
    }
    //9.判断path是否是绝对路径
    BOOL isAbsolutePath = documentsDirectory.isAbsolutePath;
    //10.获取最后一个component和删除最后一个component
    NSString *lastComponent = documentsDirectory.lastPathComponent;
    NSString *pathOfDeleteLastComponent = documentsDirectory.stringByDeletingLastPathComponent;
    NSLog(@"isAbsolutePath:%d, lastComponent:%@, pathOfDeleteLastComponet:%@", isAbsolutePath, lastComponent, pathOfDeleteLastComponent);
    
    
    //11.通过components来创建一个path
    NSString *path = [NSString pathWithComponents:@[@"desktop", @"iOS", @"Objective-C"]];
    //12.在后面加上一级路径
    NSString *addComponentPath = [path stringByAppendingPathComponent:@"avatar"];
    //13.加上扩展名
    NSString *addExtensionPath = [addComponentPath stringByAppendingPathExtension:@"img"];
    //13.获取path的扩展名
    NSString *pathExtension = addExtensionPath.pathExtension;
    //14.删除path的扩展名
    NSString *deleteExtensionPath = [addExtensionPath stringByDeletingPathExtension];
    NSLog(@"path:%@\naddComponentPath:%@\naddExtensionPath:%@\npathExtension:%@\ndeleteExtensionPath:%@", path, addComponentPath, addExtensionPath, pathExtension,deleteExtensionPath);
    //15.使用~缩写
    NSString *tildeInPath = [documentsDirectory stringByAbbreviatingWithTildeInPath];
    NSLog(@"tildeInPath:%@", tildeInPath);
    //16.不使用~缩写
    NSString *expandingPath = [tildeInPath stringByExpandingTildeInPath];
    NSLog(@"expandingPath:%@", expandingPath);
    //17.StandardizingPath
    NSString *standardizingPath = [expandingPath stringByStandardizingPath];
    NSLog(@"standardizingPath:%@", standardizingPath);
    //
    NSString *resolvingSymlinksInPath = [documentsDirectory stringByResolvingSymlinksInPath];
    NSLog(@"resovingSymlinksInPath:%@", resolvingSymlinksInPath);
    
    //19.拼接形成新的path
    NSArray *pathes = [documentsDirectory stringsByAppendingPaths:@[@"One", @"Two", @"Three"]];
    for (NSString *path in pathes) {
        NSLog(@"path:%@", path);
    }
    
}
@end

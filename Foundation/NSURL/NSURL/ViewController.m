//
//  ViewController.m
//  NSURL
//
//  Created by jianghongbing on 2017/6/4.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSURL:用于定位网络上或者本地的某一个资源
    //1.NSURL的创建
    //http URL
    NSURL *httpURL = [[NSURL alloc] initWithString:@"https://www.jianghongbing.com"];
    NSLog(@"url:%@", httpURL);

    httpURL = [NSURL URLWithString:@"https://www.jianghongbing.com"];
    NSLog(@"url:%@", httpURL);
    
    //1.1通过base url来创建,如果string中没有自己的URL,会将string拼接在baseURL的后面,如果在string中存在URL,这直接用用string来创建URL,不需要通过baseURL来拼接
    NSURL *baseURL = [NSURL URLWithString:@"http://192.168.0.100:12000"];
    httpURL = [[NSURL alloc] initWithString:@"http://192.168.0.110:20000/api/login" relativeToURL:baseURL];
    NSLog(@"url:%@", httpURL);
    
    httpURL = [NSURL URLWithString:@"api/login" relativeToURL:baseURL];
    NSLog(@"url:%@", httpURL);
    
    //file URL
    NSString *filePath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).lastObject;
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    NSLog(@"fileURL:%@", fileURL);
    
    filePath = [NSBundle mainBundle].bundlePath;
    fileURL = [NSURL fileURLWithPath:filePath relativeToURL:nil];
    NSLog(@"fileURL:%@", fileURL);
    
    //创建一个文件夹的url
    filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"folder_test"];
    fileURL = [[NSURL alloc] initFileURLWithPath:filePath isDirectory:YES relativeToURL:nil];
    NSLog(@"fileURL:%@", fileURL);
    
    //2.url的常见属性
    NSString *absoluteString = httpURL.absoluteString; //绝对路径
    NSString *relativeString = httpURL.relativeString; //相对路径,如果baseURL为空,值和绝对路径一样
    baseURL = httpURL.baseURL; //base url
    NSURL *absoluteURL = httpURL.absoluteURL; //绝对URL
    
    NSLog(@"absoluteString:%@, relativeString:%@, baseURL:%@, absoluteURL:%@", absoluteString, relativeString, baseURL, absoluteURL);
    
    NSURL *wholeURL = [NSURL URLWithString:@"https://jianghongbing:p4ssw0rd@www.jianghongbing.com:443/script.ext;param=value?query=value#ref"];
    
    NSString *scheme = wholeURL.scheme; //协议名称 https
    NSString *resourceSpecifier = wholeURL.resourceSpecifier; //jianghongbing:p4ssw0rd@www.jianghongbing.com:443/script.ext;param=value?query=value#ref
    NSString *host = wholeURL.host; //主机名 www.jianghongbing.com
    NSString *user = wholeURL.user; //用户名 jianghongbing
    NSNumber *port = wholeURL.port; //端口号 44s
    NSString *password = wholeURL.password; //用户密码 p4ssw0rd
    NSString *fragment = wholeURL.fragment; //ref
    NSString *parameterString = wholeURL.parameterString; //参数 param = value
    NSString *query = wholeURL.query; //搜索字符串 query = value
    NSString *relativePath = wholeURL.relativePath; //相对路径 /script.ext
    NSString *pathExtension = wholeURL.pathExtension; //ext
    NSArray *pathComponents = wholeURL.pathComponents;
    NSLog(@"scheme:%@\nresourceSpecifier:%@\nhost:%@\nport:%@\nuser:%@\npassword:%@\nfragment:%@\nparamterString:%@\nquery:%@\nrelativePath:%@\npathExtension:%@\npathComponents:%@\n",scheme, resourceSpecifier, host, port, user, password, fragment, parameterString, query, relativePath, pathExtension, pathComponents);
    
    
    //3.hasDirectoryPath:是否有目录
    BOOL hasDirectoryPath = fileURL.hasDirectoryPath;
    NSLog(@"hasDiretoryPath:%d", hasDirectoryPath);
    //4.是否是文件URL
    BOOL isFileURL = fileURL.isFileURL;
    NSLog(@"isFileURL:%d", isFileURL);
    isFileURL = httpURL.isFileURL;
    NSLog(@"isFileURL:%d", isFileURL);
    
    //5.文件URL协议名
    NSString *fileURLScheme = NSURLFileScheme;
    NSLog(@"fileURLScheme:%@", fileURLScheme);
    
    //6.文件系统路径
    const char *fileSystemRepresentation = fileURL.fileSystemRepresentation;
    NSLog(@"fileSystemRepresentation:%s", fileSystemRepresentation);
    
    //7.是否有文件引用该URL
    BOOL isFileReferenceURL = fileURL.isFileReferenceURL;
    if (isFileReferenceURL) {
        NSURL *fileReferenceURL = fileURL.fileReferenceURL;
        NSLog(@"fileRefrecenURL:%@", fileReferenceURL);
    }else {
        NSLog(@"isFileRefreceURL:%d", isFileReferenceURL);
    }
    //8.standardizedURL
    NSURL *standardizeURL = fileURL.standardizedURL;
    NSLog(@"standradizeURL:%@", standardizeURL);
    
    //9.检查资源是否存在并且是否可以到达,只是用与FileURL
    NSError *error;
    BOOL isReachable = [fileURL checkResourceIsReachableAndReturnError:&error];
    if (!error) {
        if (isReachable) {
            NSLog(@"资源存在");
        }else {
            NSLog(@"资源不存在");
        }
    }else {
        NSLog(@"error:%@", error);
    }
    
    //10.获取资源信息
    fileURL = [NSURL fileURLWithPath:NSHomeDirectory()];
    
    NSString *volumeDesc;
    NSNumber *totalCapacity;
    NSNumber *availableCapacity;
    NSNumber *resourceCount;
    BOOL success = [fileURL getResourceValue:&volumeDesc forKey:NSURLVolumeLocalizedFormatDescriptionKey error:&error];
    if (error) {
        NSLog(@"error:%@", error);
    }else {
        if (success) {
            NSLog(@"volumeDesc:%@", volumeDesc);
        }else {
            NSLog(@"get value failured");
        }
    }
    
    success = [fileURL getResourceValue:&totalCapacity forKey:NSURLVolumeTotalCapacityKey error:&error];
    if (error) {
        NSLog(@"error:%@", error);
    }else {
        if (success) {
            NSLog(@"totalCapacity:%.1fG", totalCapacity.floatValue / 1000.0 / 1000.0 / 1000);
        }else {
            NSLog(@"get value failured");
        }
    }
    
    success = [fileURL getResourceValue:&availableCapacity forKey:NSURLVolumeAvailableCapacityKey error:&error];
    if (error) {
        NSLog(@"error:%@", error);
    }else {
        if (success) {
            NSLog(@"availableCapacity:%.1fG", availableCapacity.floatValue / 1000.0 / 1000.0 / 1000.0);
        }else {
            NSLog(@"get value failured");
        }
    }
    
    //资源数量
    success = [fileURL getResourceValue:&resourceCount forKey:NSURLVolumeResourceCountKey error:&error];
    if (error) {
        NSLog(@"error:%@", error);
    }else {
        if (success) {
            NSLog(@"resourceCount:%@", resourceCount);
        }else {
            NSLog(@"get value failured");
        }
    }
    
    NSDictionary *info = [fileURL resourceValuesForKeys:@[NSURLVolumeNameKey, NSURLVolumeIsReadOnlyKey, NSURLVolumeIsLocalKey, NSURLVolumeIdentifierKey] error:&error];
    if (error) {
        NSLog(@"error:%@", error);
    }else {
        [info enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"key:%@, value:%@", key, obj);
        }];
    }
    
    //11.设置资源信息
//    fileURL setResourceValues:<#(nonnull NSDictionary<NSURLResourceKey,id> *)#> error:<#(NSError * _Nullable __autoreleasing * _Nullable)#>
//    fileURL setResourceValue:<#(nullable id)#> forKey:<#(nonnull NSURLResourceKey)#> error:<#(NSError * _Nullable __autoreleasing * _Nullable)#>
    
    //12.移除资源缓存的信息
//    [fileURL removeAllCachedResourceValues]; //移除所有的资源缓存的信息
//    [fileURL removeCachedResourceValueForKey:nil]; //移除对应key的缓存的信息
//    fileURL setTemporaryResourceValue:nil forKey:nil //设置临时的资源信息
    
    //13.book mark test
    
    //14.NSURLPathUtilities,只适用于File URL
    [self urlPathUtilities];
}

- (void)bookMarkTest {
    
}

- (void)urlPathUtilities {
    NSURL *myURL = [NSURL URLWithString:NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).lastObject];
    NSLog(@"myURL:%@",myURL);
    NSArray *pathComponents = myURL.pathComponents;
    NSString *lastPathComponent = myURL.lastPathComponent;
    NSLog(@"pathcomponets:%@,lastPathComponents:%@", pathComponents, lastPathComponent);
    
    NSURL *modifyURL = [myURL URLByAppendingPathComponent:@"jianghongbing"];
    NSLog(@"changeURL:%@", modifyURL);
    modifyURL = [modifyURL URLByAppendingPathExtension:@".png"];
    NSString *pathExtension = modifyURL.pathExtension;
    NSLog(@"changeURL:%@, pathExtension:%@", modifyURL, pathExtension);

    modifyURL = [modifyURL URLByDeletingPathExtension];
    NSLog(@"changeURL:%@", modifyURL);
    modifyURL = [modifyURL URLByDeletingLastPathComponent];
    NSLog(@"changeURL:%@", modifyURL);
    
    NSURL *URLByStandardizingPath = modifyURL.URLByStandardizingPath;
    NSURL *URLByResolvingSymlinksInPath = modifyURL.URLByResolvingSymlinksInPath;
    NSLog(@"url:%@,%@", URLByStandardizingPath, URLByResolvingSymlinksInPath);
    
    
}

@end

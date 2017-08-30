//
//  ViewController.m
//  NSFileManager
//
//  Created by jianghongbing on 2017/8/27.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSFileManagerDelegate>

@end

static NSString * const fileName = @"test.txt";
static NSString * const fileFolderName = @"testFolder";
static NSString * const hardLinkName = @"hardLink";


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //NSFileManager:用于对文件的管理,比如文件的保存,删除,移到另外一个位置等
    //1.获取NSFileManager, NSFileManager采用了单例设计模式
//    NSFileManager *fileManager = [NSFileManager defaultManager];
    //2.获取文件权限信息
    [self getFilePermission];
    
    //3.文件和文件夹的创建
    [self createFile];
    
    //4.将文件或者文件夹移动到另外一个位置
    [self moveFile];
    
    //5.文件或者文件夹的拷贝
    [self duplicateFile];
    
    //6.文件和文件夹的删除
    [self deleteFile];
    
    //7.创建快捷方式
    [self createLink];
    
    //8.创建hard link,和copy的功能一样
    [self createHardLink];
    
    //9.获取文件信息
    [self getFileInfo];
    
    //10.delegate
}

- (void)getFilePermission {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"avatar.jpg"];
    //1.判断文件是否存在
    BOOL isExist = [fileManager fileExistsAtPath:filePath];
    
    //2.判断文件是否存在, 如果存在还可以判断其是否为文件夹.
    BOOL isDirectory;
    BOOL documentPathIsExist = [fileManager fileExistsAtPath:documentPath isDirectory:&isDirectory];
    
    //3.判断文件是否可读
    BOOL isReadable = [fileManager isReadableFileAtPath:documentPath];
    //4.判断文件是否可写
    BOOL isWritable = [fileManager isWritableFileAtPath:documentPath];
    //5.判断文件是否可以删除
    BOOL isDeletable = [fileManager isDeletableFileAtPath:documentPath];
    //6.判断文件是否为可执行文件
    BOOL isExecutableFile = [fileManager isExecutableFileAtPath:documentPath];
    NSLog(@"isExist:%d\nisDirectory:%d\ndocumentPathIsExist:%d\nisReadable:%d\nisWritable:%d\nisDeletable:%d\nisExecutableFile:%d", isExist, isDirectory, documentPathIsExist, isReadable, isWritable, isDeletable, isExecutableFile);
}

- (void)createFile {
    //1.创建文件
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    fileManager.delegate = self;
    NSString *filePath = [documentPath stringByAppendingPathComponent:fileName];
    BOOL isExist = [fileManager fileExistsAtPath:filePath];
    if (isExist) {
        NSLog(@"filePath is already exist");
    }else {
        NSError *error = nil;
        //创建文件,filePath:文件的路径 contents:文件的内容 attributes:文件的属性,如更改日期,文件创建人等基本信息
        BOOL isSuccess = [fileManager createFileAtPath:filePath contents:nil attributes:nil];
        if (error) {
            NSLog(@"error:%@", error.localizedDescription);
        }else {
            if (isSuccess) {
                NSLog(@"create file: %@ success", filePath);
            }else {
                NSLog(@"create file: %@ failure", filePath);
            }
        }
    }
    
    //2.文件夹的创建
    NSString *folderPath = [documentPath stringByAppendingPathComponent:fileFolderName];
    isExist = [fileManager fileExistsAtPath:folderPath];
    if (isExist) {
        NSLog(@"folder is already exist");
    }else {
        NSError *error = nil;
        //IntermediateDirectories:是否文件夹中还包含其他文件,YES:包含有其他文件,NO:不包含其他文件
        BOOL isSuccess = [fileManager createDirectoryAtPath:folderPath withIntermediateDirectories:NO attributes:nil error:&error];
//        [fileManager createDirectoryAtURL:nil withIntermediateDirectories:nil attributes:nil error:nil];//通上面的功能一致
        if (error) {
            NSLog(@"error:%@", error.localizedDescription);
        }else {
            if (isSuccess) {
                NSLog(@"create folder: %@ success", folderPath);
            }else {
                NSLog(@"create folder: %@ failure", folderPath);
            }
        }
    }
}

- (void)moveFile {
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    fileManager.delegate = self;
    NSString *filePath = [documentPath stringByAppendingPathComponent:fileName];
    BOOL isExist = [fileManager fileExistsAtPath:filePath];
    if (!isExist) {
        NSLog(@"file is not exist at path :%@", filePath);
    }else {
        NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        NSString *newFilePath = [cachePath stringByAppendingPathComponent:fileName];
        
        BOOL isExist = [fileManager fileExistsAtPath:newFilePath];
        if (!isExist) {
            NSLog(@"filei is exist at path:%@", newFilePath);
        }else {
            NSError *error = nil;
            BOOL moveSuccess = [fileManager moveItemAtPath:filePath toPath:newFilePath error:&error];
            //        [fileManager moveItemAtURL:nil toURL:nil error:nil]; //和上面的功能一样都是
            if (error) {
                NSLog(@"error:%@", error.localizedDescription);
            }else {
                if (moveSuccess) {
                    NSLog(@"file move from:%@ to:%@ success" ,filePath, newFilePath);
                }else {
                    NSLog(@"file move from:%@ to:%@ failure" ,filePath, newFilePath);
                }
            }
        }
    }
    
}

- (void)duplicateFile {
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    fileManager.delegate = self;
    NSString *filePath = [documentPath stringByAppendingPathComponent:fileName];
    BOOL isExist = [fileManager fileExistsAtPath:filePath];
    if (!isExist) {
        NSLog(@"file is not exist at path :%@", filePath);
    }else {
        NSString *destinationFolderPath = [[documentPath stringByAppendingPathComponent:fileFolderName] stringByAppendingPathComponent:fileName];
        if (!destinationFolderPath) {
            NSLog(@"destination folder path :%@ is not exist", destinationFolderPath);
        }else {
            NSError *error = nil;
            BOOL duplicateSuccess = [fileManager  copyItemAtPath:filePath toPath:destinationFolderPath error:&error];
//            [fileManager copyItemAtURL:nil toURL:nil error:nil];//和上面的功能一样
            if (error) {
                NSLog(@"error:%@", error.localizedDescription);
            }else {
                if (duplicateSuccess) {
                    NSLog(@"copy file success");
                }else {
                    NSLog(@"copy file failure");
                }
            }
        }
    }
}

- (void)deleteFile {
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    fileManager.delegate = self;
    NSString *filePath = [documentPath stringByAppendingPathComponent:fileName];
    BOOL isExist = [fileManager fileExistsAtPath:filePath];
    if (!isExist) {
        NSLog(@"file is not exist at path :%@", filePath);
    }else {
        NSError *error = nil;
        BOOL isSuccess = [fileManager removeItemAtPath:filePath error:&error];
//        [fileManager removeItemAtURL:nil error:nil]; //获取上面的功能一样
        if (error) {
            NSLog(@"error:%@", error.localizedDescription);
        }else {
            if (isSuccess) {
                NSLog(@"delete file success");
            }else {
                NSLog(@"delete file failure");
            }
        }
    }
}

- (void)createLink {
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *destinationPath = [documentPath stringByAppendingPathComponent:fileFolderName];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    fileManager.delegate = self;
    BOOL isExist = [fileManager fileExistsAtPath:destinationPath];
    if (!isExist) {
        NSLog(@"file is not exist at path : %@" , destinationPath);
    }else {
        NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        NSString *linkPath = [cachePath stringByAppendingPathComponent:fileFolderName];
        BOOL isExist = [fileManager fileExistsAtPath:linkPath];
        if (isExist) {
            NSLog(@"linkPath path is already exist");
        }else {
            NSError *error = nil;
            BOOL isSuccess = [fileManager createSymbolicLinkAtPath:linkPath withDestinationPath:destinationPath error:&error];
//            [fileManager createSymbolicLinkAtURL:nil withDestinationURL:nil error:nil]; //通上面的功能一致
            if (error) {
                NSLog(@"create sysbomlic link error:%@", error.localizedDescription);
            }else {
                if (isSuccess) {
                    NSLog(@"create symbolic link success");
                }else {
                    NSLog(@"create sysbolic link failure");
                }
            }
        }
    }
}

- (void)createHardLink {
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *sourcePath = [documentPath stringByAppendingPathComponent:fileFolderName];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    fileManager.delegate = self;
    BOOL isExist = [fileManager fileExistsAtPath:sourcePath];
    if (!isExist) {
        NSLog(@"file is not exist at path : %@" , sourcePath);
    }else {
        NSString *tmpPath = NSTemporaryDirectory();
        NSString *hardLinkPath = [tmpPath stringByAppendingPathComponent:hardLinkName];
        BOOL isExist = [fileManager fileExistsAtPath:hardLinkPath];
        if (isExist) {
            NSLog(@" hardLinkPath path is already exist");
        }else {
            NSError *error = nil;
            BOOL isSuccess = [fileManager linkItemAtPath:sourcePath toPath:hardLinkPath error:&error];
//            [fileManager linkItemAtURL:nil toURL:nil error:nil]; //同上面的功能一致
            if (error) {
                NSLog(@"create hard link error:%@", error.localizedDescription);
            }else {
                if (isSuccess) {
                    NSLog(@"create hard link success");
                }else {
                    NSLog(@"create hard link failure");
                }
            }
        }
    }
}

- (void)getFileInfo {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *folderPath = [documentPath stringByAppendingPathComponent:fileFolderName];
    
    NSError *error = nil;
    //1.获取文件夹里面的所有文件和文件夹
    NSArray *contentsOfPath = [fileManager contentsOfDirectoryAtPath:folderPath error:&error];
    
    if (error) {
        NSLog(@"error:%@", error.localizedDescription);
    }else {
        for (NSString *contentPath in contentsOfPath) {
            NSLog(@"contentPath:%@", contentPath);
        }
    }
    
    //2.获取文件夹里面的所有文件或者文件夹的子路径
    NSArray *subPathes = [fileManager subpathsOfDirectoryAtPath:documentPath error:&error];
    if (error) {
        NSLog(@"error:%@", error.localizedDescription);
    }else {
        for (NSString *subPath in subPathes) {
            NSLog(@"subPath:%@", subPath);
        }
    }
    
    //3.获取文件的属性
    NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:folderPath error:&error];
    if (error) {
        NSLog(@"error:%@", error.localizedDescription);
    }else {
        [fileAttributes enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL * stop) {
            NSLog(@"key:%@,value:%@", key, obj);
        }];
    }
    
    //常用到的文件的属性
    //NSFileCreationDate:文件的创建日期
    //NSFileModificationDate:文件修改日期
    //NSFileExtensionHidden:文件扩展名是否隐藏
    //NSFileSize:文件的大小
    //NSFileType:文件的类型
    //NSFileBusy:文件是否正在使用
    //NSFileOwnerAccountName:文件所有者的姓名
    
    //4.设置文件的属性
    NSDictionary *attributes = @{NSFileOwnerAccountName : @"jianghonbing"};
    BOOL isSuccess = [fileManager setAttributes:attributes ofItemAtPath:folderPath error:&error];
    if (error) {
        NSLog(@"error:%@", error.localizedDescription);
    }else {
        if (isSuccess) {
            NSLog(@"set attributes success");
        }else {
            NSLog(@"set attributes failure");
        }
    }
    
    //5.文件的系统属性
    NSDictionary *fileSystemAttributes = [fileManager attributesOfFileSystemForPath:folderPath error:&error];
    if (error) {
        NSLog(@"error:%@", error.localizedDescription);
    }else {
        [fileSystemAttributes enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            NSLog(@"system attributes key:%@, value:%@", key, obj);
        }];
    }
    
    //6.文件内容的比较contents的比较
    NSString *filePathOne = [folderPath stringByAppendingPathComponent:@"test123.txt"];
    NSString *filePathTwo = [folderPath stringByAppendingPathComponent:@"test456.txt"];
    if ([fileManager fileExistsAtPath:filePathOne] && [fileManager fileExistsAtPath:filePathTwo]) {
        BOOL isEqual = [fileManager contentsEqualAtPath:filePathOne andPath:filePathTwo];
        NSLog(@"isEqual:%d", isEqual);
    }
    //7.获取文件的显示名
    NSString *displayName = [fileManager displayNameAtPath:filePathOne];
    NSLog(@"displayName:%@", displayName);
    //8.显示的componnents
    NSArray *components = [fileManager componentsToDisplayForPath:filePathOne];
    NSLog(@"components:%@", components);
    
    //9.获取文件里面包含其他文件或者文件夹的枚举器
    NSDirectoryEnumerator *enumerator = [fileManager enumeratorAtPath:folderPath];
    for (NSString *path in enumerator) {
        NSLog(@"path:%@", path);
    }
    //枚举的选项:
    //NSDirectoryEnumerationSkipsSubdirectoryDescendants: 跳过子目录的扫描
    //NSDirectoryEnumerationSkipsPackageDescendants:不会扫描到packages的里面的文件
    //NSDirectoryEnumerationSkipsHiddenFiles:跳过隐藏文件的扫描
    enumerator = [fileManager enumeratorAtURL:[NSURL fileURLWithPath:documentPath] includingPropertiesForKeys:nil options:NSDirectoryEnumerationSkipsHiddenFiles | NSDirectoryEnumerationSkipsSubdirectoryDescendants errorHandler:^BOOL(NSURL * _Nonnull url, NSError * _Nonnull error) {
        NSLog(@"error:%@, url:%@", error.localizedDescription, url);
        return YES;
    }];
    
    for (NSString *path in enumerator) {
        NSLog(@"path by block enumerator:%@", path);
    }
    
    //10.获取文件的子目录
    subPathes = [fileManager subpathsAtPath:filePathOne];
    NSLog(@"subPathes:%@" ,subPathes);
    
    //11.获取文件的数据
    NSData *data = [fileManager contentsAtPath:filePathOne];
    NSString *text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"text:%@" ,text);
    
    //12.fileRepresentation
    const char * fileRepresentation = [fileManager fileSystemRepresentationWithPath:filePathOne];
    NSLog(@"fileRepresentation:%s", fileRepresentation);
    
    //13.是否为iCould文件URL
    BOOL isUbiquitousItemAtURL = [fileManager isUbiquitousItemAtURL:[NSURL fileURLWithPath:filePathOne]];
    NSLog(@"isUbiquitousItemAtURL:%d", isUbiquitousItemAtURL);
}


#pragma mark NSFileManagerDelegate 
//1.是否允许将文件拷贝到其他位置
- (BOOL)fileManager:(NSFileManager *)fileManager shouldCopyItemAtURL:(nonnull NSURL *)srcURL toURL:(nonnull NSURL *)dstURL {
    NSLog(@"func:%s, scrURL:%@, toURL:%@", __func__, srcURL, dstURL);
    return YES;
}

//2.同上
- (BOOL)fileManager:(NSFileManager *)fileManager shouldCopyItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath {
    NSLog(@"func:%s, srcPath:%@, toPath:%@", __func__, srcPath, dstPath);
    return YES;
}

//3.如果在copy文件过程中,发生了error,是否继续处理,没有实现,系统默认为NO,发生错误后不会继续处理,返回YES则继续处理
- (BOOL)fileManager:(NSFileManager *)fileManager shouldProceedAfterError:(NSError *)error copyingItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL {
    NSLog(@"func:%s, scrURL:%@, toURL:%@", __func__, srcURL, dstURL);
    return NO;
}
//4.同上
- (BOOL)fileManager:(NSFileManager *)fileManager shouldProceedAfterError:(NSError *)error copyingItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath {
    NSLog(@"func:%s, srcPath:%@, toPath:%@", __func__, srcPath, dstPath);
    return NO;
}

//5.是否允许将文件从当前位置移动到其他的位置
- (BOOL)fileManager:(NSFileManager *)fileManager shouldMoveItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL {
    NSLog(@"func:%s, scrURL:%@, toURL:%@", __func__, srcURL, dstURL);
    return YES;
}

//6.同上
- (BOOL)fileManager:(NSFileManager *)fileManager shouldMoveItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath {
    NSLog(@"func:%s, srcPath:%@, toPath:%@", __func__, srcPath, dstPath);
    return YES;
}

//7.参考3
- (BOOL)fileManager:(NSFileManager *)fileManager shouldProceedAfterError:(NSError *)error movingItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath {
    NSLog(@"func:%s, srcPath:%@, toPath:%@", __func__, srcPath, dstPath);
    return NO;
}

//8.同上
- (BOOL)fileManager:(NSFileManager *)fileManager shouldProceedAfterError:(NSError *)error movingItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL {
    NSLog(@"func:%s, scrURL:%@, toURL:%@", __func__, srcURL, dstURL);
    return NO;
}

//9.是否可以link
- (BOOL)fileManager:(NSFileManager *)fileManager shouldLinkItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath {
    NSLog(@"func:%s, srcPath:%@, toPath:%@", __func__, srcPath, dstPath);
    return YES;
}

//10.同上
- (BOOL)fileManager:(NSFileManager *)fileManager shouldLinkItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL {
    NSLog(@"func:%s, scrURL:%@, toURL:%@", __func__, srcURL, dstURL);
    return YES;
}

//11.参考3
- (BOOL)fileManager:(NSFileManager *)fileManager shouldProceedAfterError:(NSError *)error linkingItemAtPath:(NSString *)srcPath toPath:(NSString *)dstPath {
    NSLog(@"func:%s, srcPath:%@, toPath:%@", __func__, srcPath, dstPath);
    return NO;
}
//12.同上
- (BOOL)fileManager:(NSFileManager *)fileManager shouldProceedAfterError:(NSError *)error linkingItemAtURL:(NSURL *)srcURL toURL:(NSURL *)dstURL {
    NSLog(@"func:%s, scrURL:%@, toURL:%@", __func__, srcURL, dstURL);
    return NO;
}

//13.文件是否可以被移除
- (BOOL)fileManager:(NSFileManager *)fileManager shouldRemoveItemAtURL:(NSURL *)URL {
    NSLog(@"func:%s, URL:%@", __func__, URL);
    return YES;
}

//14.同上
- (BOOL)fileManager:(NSFileManager *)fileManager shouldRemoveItemAtPath:(NSString *)path {
    NSLog(@"func:%s, path:%@", __func__, path);
    return YES;
}

//15.参考3
- (BOOL)fileManager:(NSFileManager *)fileManager shouldProceedAfterError:(NSError *)error removingItemAtURL:(NSURL *)URL {
    NSLog(@"func:%s, URL:%@, error:%@", __func__, URL, error.localizedDescription);
    return NO;
}

//16.同上
- (BOOL)fileManager:(NSFileManager *)fileManager shouldProceedAfterError:(NSError *)error removingItemAtPath:(NSString *)path {
    NSLog(@"func:%s, path:%@, error:%@", __func__, path, error.localizedDescription);
    return NO;
}

@end

//
//  ViewController.m
//  NSFileManager
//
//  Created by jianghongbing on 2017/8/27.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

static NSString * const fileName = @"test.txt";
static NSString * const fileFolderName = @"testFolder";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //NSFileManager:用于对文件的管理,比如文件的保存,删除,移到另外一个位置等
    //1.获取NSFileManager, NSFileManager采用了单例设计模式
//    NSFileManager *fileManager = [NSFileManager defaultManager];
    //2.获取文件信息
    [self getFileInfo];
    
    //3.文件和文件夹的创建
    [self createFile];
    
    //4.将文件或者文件夹移动到另外一个位置
    [self moveFile];
    
    //5.文件或者文件夹的拷贝
    [self duplicateFile];
    
    //6.文件和文件夹的删除
    [self deleteFile];
}

- (void)getFileInfo {
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
    NSString *filePath = [documentPath stringByAppendingPathComponent:fileName];
    BOOL isExist = [fileManager fileExistsAtPath:filePath];
    if (!isExist) {
        NSLog(@"file is not exist");
    }else {
        NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        NSString *newFilePath = [cachePath stringByAppendingPathComponent:fileName];
        NSError *error = nil;
        BOOL moveSuccess = [fileManager moveItemAtPath:filePath toPath:newFilePath error:&error];
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

- (void)duplicateFile {
    
}

- (void)deleteFile {
    
}



@end

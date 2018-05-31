//
//  ViewController.m
//  NSProcessInfo
//
//  Created by pantosoft on 2018/5/30.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSProcessInfo:保存着当前处理器的相关信息
    NSProcessInfo *processInfo = [NSProcessInfo processInfo];
    //1.处理器的环境信息
    NSDictionary *environment = [processInfo environment];
    NSLog(@"environment:%@", environment);
    //2.arguments:参数信息
    NSArray *arguments = [processInfo arguments];
    NSLog(@"arguments:%@", arguments);
    //3.hostName:主机名
    NSString *hostName = processInfo.hostName;
    //4.处理器名称:通过NSUserDefault注册而来的
    NSString *processName = processInfo.processName;
    NSLog(@"hostName:%@, processName:%@", hostName, processName);
    int processIdentifier = processInfo.processIdentifier; //process id
    NSString *globallyUniqueString = processInfo.globallyUniqueString; //process 全局唯一标识符
    NSLog(@"processIdentifier:%d,globallyUniqueString:%@", processIdentifier, globallyUniqueString);
    NSString *operatingSystemVersionString = processInfo.operatingSystemVersionString; //当前process所在的设备的系统版本的字符串描述
    //5.系统版本,如iOS11.2.6, majorVersion为11,minorVersion为2,patchVersion为6
    NSOperatingSystemVersion operatingSystemVersion = processInfo.operatingSystemVersion;
    NSInteger majorVersion = operatingSystemVersion.majorVersion; //主版本
    NSInteger minorVersion = operatingSystemVersion.minorVersion; //次版本
    NSInteger patchVersion = operatingSystemVersion.patchVersion; //补丁版本
    NSLog(@"operatingSystemVersionString:%@, operatingSystemVersion:%ld-%ld-%ld", operatingSystemVersionString, majorVersion, minorVersion, patchVersion);
    
    NSUInteger processCount = processInfo.processorCount; //处理器核数量
    NSUInteger activeProcessorCount = processInfo.activeProcessorCount; //活动的处理器核数量
    unsigned long long physicalMemory = processInfo.physicalMemory; //内存大小
    NSLog(@"processCount:%zi, activeProcessorCount:%zi physicalMemory:%.2fM", processCount, activeProcessorCount, physicalMemory / 1024.0 / 1024.0);
    
    NSOperatingSystemVersion version = {10, 2 ,0};
    //6.判断当前系统版本是否比另外系统版本出的晚(当前系统版本比另外一个版本新,或者一样新)
    BOOL isLaterOtherVersion = [processInfo isOperatingSystemAtLeastVersion:version];
    //7.系统现在的时时间到上一次设备重启的时间的差,
    long long systemUptime = processInfo.systemUptime;
    NSDate *lastRestartDate = [NSDate dateWithTimeIntervalSinceNow:-systemUptime];
    NSLog(@"isLaterOtherVersion:%d, lastRestartDate:%@", isLaterOtherVersion, lastRestartDate);
    //8.散热器状态,一般cpu的任务越大,散热器的风扇转的越快,发出的声音也越大,因此可以通过散热器的状态来表示cpu的负荷
    //NSProcessInfoThermalStateNominal,负荷正常
    //NSProcessInfoThermalStateFair, 负荷有点大
    //NSProcessInfoThermalStateSerious, 负荷大
    //NSProcessInfoThermalStateCritical 负荷非常大
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    if (@available(iOS 11.0, *)) {
        NSProcessInfoThermalState thermalState = processInfo.thermalState;
        NSLog(@"thermalState:%ld", thermalState);
        //thermal发生状态改变的通知
        [notificationCenter addObserver:self selector:@selector(deviceThermalStateChanged:) name:NSProcessInfoThermalStateDidChangeNotification object:nil];
        
    }
    BOOL lowPowerModeEnabled = processInfo.lowPowerModeEnabled; //是否开启低电量模式
    NSLog(@"lowPowerModeEnabled:%d", lowPowerModeEnabled);
    //低电量模式发生改变时的通知
    [notificationCenter addObserver:self selector:@selector(deviceLowPowerModeChanged:) name:NSProcessInfoPowerStateDidChangeNotification object:nil];
    //执行活动
//    id object = [processInfo beginActivityWithOptions:NSActivityUserInitiated | NSActivityUserInitiatedAllowingIdleSystemSleep reason:@"com.processInfo.testteset"];
//    [processInfo endActivity:object];
//    [processInfo performActivityWithOptions:NSActivityIdleSystemSleepDisabled reason:@"testest" usingBlock:^{
//        NSLog(@"perform activity");
//    }];
//    //执行过期活动
//    [processInfo performExpiringActivityWithReason:@"expiring task" usingBlock:^(BOOL expired) {
//        NSLog(@"excute expiring task:%d", expired);
//    }];
    //只有macOS支持的属性和方法
//    @property (readonly, copy) NSString *userName
//    @property (readonly, copy) NSString *fullUserName
//    - (void)disableSuddenTermination
//    - (void)enableSuddenTermination
//    - (void)disableAutomaticTermination:(NSString *)reason
//    - (void)enableAutomaticTermination:(NSString *)reason
//    @property BOOL automaticTerminationSupportEnabled
}

- (void)deviceLowPowerModeChanged:(NSNotification *)notification {
    NSLog(@"deviceLowPowerModeChanged:%d, notification:%@", [NSProcessInfo processInfo].lowPowerModeEnabled, notification);
}

- (void)deviceThermalStateChanged:(NSNotification *)notification {
        NSLog(@"deviceThermalStateChanged:%d, notification:%@", [NSProcessInfo processInfo].lowPowerModeEnabled, notification);
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end

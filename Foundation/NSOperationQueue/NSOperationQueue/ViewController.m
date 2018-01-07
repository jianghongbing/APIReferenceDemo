//
//  ViewController.m
//  NSOperationQueue
//
//  Created by pantosoft on 2018/1/5.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSOperationQueue:NSOperation执行队列,以FIFO的方式来处理NSOperation
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    //1.设置queue的名字
    queue.name = @"com.test.myQueue";
    //2.添加NSOperation到queue中去,添加到队列中的NSOperation会异步去执行任务,而且不需要手动调用start方法
    NSBlockOperation *operationOne = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"operationOne:%@", [NSThread currentThread]);
    }];
    [operationOne addExecutionBlock:^{
        NSLog(@"operationOne block:%@", [NSThread currentThread]);
    }];
    
    NSOperation *operationTwo = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(excuteOperation) object:nil];
    [queue addOperation:operationOne];
    [queue addOperation:operationTwo];
    [queue addOperationWithBlock:^{
        NSLog(@"operationThree:%@", [NSThread currentThread]);
    }];
    
    //3.waitUntilFinished:用于阻塞当前线程,如果为YES,等待queue中的任务执行完成,再去执行后面的代码,如果为NO,会立即返回,去执行后面的代码,在执行queue中的任务时同时执行后面的代码(queue的opration还是并发执行的)
    NSOperation *operationThree = [NSBlockOperation blockOperationWithBlock:^{
        int i = 1000;
        while (i-- > 0) {
            NSLog(@"i=%d", i);
        }
    }];
    [queue addOperations:@[operationThree] waitUntilFinished:YES];
//    [queue waitUntilAllOperationsAreFinished];
    NSLog(@"waitUntilFinished");
    
    
}

- (void)excuteOperation {
    NSLog(@"operationTwo:%@", [NSThread currentThread]);
}

@end

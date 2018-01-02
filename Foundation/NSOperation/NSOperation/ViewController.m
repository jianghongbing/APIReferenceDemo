//
//  ViewController.m
//  NSOperation
//
//  Created by pantosoft on 2018/1/2.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import "ViewController.h"
#import "CustomOperation.h"
@interface ViewController ()
@property (nonatomic, strong) NSOperation *operation;
@property (weak, nonatomic) IBOutlet UILabel *readyStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *excutingStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *finishedStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *asynchronousStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *canceledStatusLabel;
@property (nonatomic, strong) NSDictionary *labels;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSOperation:表示执行一个任务的单元,NSOpration是一个抽象类,一般用其子类NSInvocationOperation或者NSBlockOpration来执行任务
    //1.NSInvocationOperation
//    [self invocationOperationTest];
    //2.NSBlockOperation
//    [self blockOperationTest];
    //3.operation依赖
//    [self operationDependance];
    //4.operation状态
    [self operationStatus];
    //5.自定义operation,需要重写main方法,当调用start方法后,就会执行main方法
    [self customOperation];
}

- (void)dealloc {
    [self removeKVO];
}


- (void)invocationOperationTest{
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(excuteLoop:) object:@2000];
    //1.设置opeartion的名字
    operation.name = @"com.test.invocationOperatioin";
    //2.设置operation的优先级
    operation.qualityOfService = NSQualityOfServiceDefault;
    //3.operation完成后的回调
    operation.completionBlock = ^{
        NSLog(@"operation completion");
    };
    //4.执行任务,NSOperation默认执行任务是同步的,不会开启独立的线程去执行该任务,如果想要异步执行任务,可以将operation放入NSOperationQueue中,执行即可
    [operation start];
//    [operation waitUntilFinished];
    //5.获取NSInvocationOperation的invocation和result
    NSInvocation *invocation = operation.invocation;
    NSString *result = operation.result;
    NSLog(@"invocation:%@,result:%@", invocation, result);
//    NSMethodSignature *methodSignature = [self methodSignatureForSelector:@selector(excuteLoop:)];
//    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
//    NSNumber *countNumber = @2000;
//    [invocation setArgument:&countNumber atIndex:2];
//    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithInvocation:invocation];
//    [operation start];
}

- (void)blockOperationTest {
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        int i = 1000;
        while (i > 0) {
            NSLog(@"aaa=%d", i--);
        }
    }];
    
    [operation addExecutionBlock:^{
        int i = 1000;
        while (i > 0) {
            NSLog(@"bbb=%d", i--);
        }
    }];
    //获取blockOperation中的block
    NSArray *blockArray = operation.executionBlocks;
    for (id block in blockArray) {
        NSLog(@"block:%@", block);
    }
    [operation start];
}

- (void)operationDependance {
    //operation之间的依赖,等待依赖的operation完成后,在执行当前的opeartion,不能再同步中做operation之间的依赖,容易导致其中的一个operation状态不为ready,而产生异常
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        int i = 1000;
        while (i > 0) {
            NSLog(@"aaa=%d", i--);
        }
    }];
    NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(excuteLoop:) object:@1000];
    [blockOperation addDependency:invocationOperation]; //添加依赖
//    [blockOperation removeDependency:invocationOperation]; //移除依赖
//    NSArray *dependencies = blockOperation.dependencies //获取依赖
//    [blockOperation start];
//    [invocationOperation start];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:blockOperation];
    [queue addOperation:invocationOperation];
    
}

- (void)operationStatus {
    NSArray *keyPathes = [self KVOKeyPathes];
    self.labels = [NSDictionary dictionaryWithObjects:@[self.canceledStatusLabel, self.excutingStatusLabel, self.finishedStatusLabel, self.asynchronousStatusLabel, self.readyStatusLabel] forKeys:keyPathes];
}

- (void)customOperation {
    CustomOperation *operation = [[CustomOperation alloc] initWithBlock:^{
        NSLog(@"customOperation");
    } excuteCount:3];
    [operation start];
}


- (void)addKVO {
    NSArray *KVOKeyPathes = [self KVOKeyPathes];
    for (NSString *keyPath in KVOKeyPathes) {
        [self.operation addObserver:self forKeyPath:keyPath options: NSKeyValueObservingOptionNew context:nil];
    }
}

- (void)removeKVO {
    NSArray *KVOKeyPathes = [self KVOKeyPathes];
    for (NSString *keyPath in KVOKeyPathes) {
        [self.operation removeObserver:self forKeyPath:keyPath];
    }
}

- (NSArray *)KVOKeyPathes {
    return @[@"isCancelled", @"isExecuting", @"isFinished", @"isAsynchronous", @"isReady"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    BOOL newValue = change[NSKeyValueChangeNewKey];
    NSString *yerOrNo = newValue ? @"YES" : @"NO";
    NSString *labelText = [NSString stringWithFormat:@"%@:%@", keyPath, yerOrNo];
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        UILabel *label = self.labels[keyPath];
        label.text = labelText;
        [self.view layoutIfNeeded];
    }];
//    NSLog(@"keyPath:%@,%d", keyPath, newValue);
//    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//        if ([keyPath isEqualToString:@"isCancelled"]) {
//            self.canceledStatusLabel.text = labelText;
//            NSLog(@"12345:%@:%d", labelText, self.operation.isCancelled);
//        }else if ([keyPath isEqualToString:@"isExecuting"]) {
//            self.excutingStatusLabel.text = labelText;
//        }else if ([keyPath isEqualToString:@"isFinished"]) {
//            self.finishedStatusLabel.text = labelText;
//        }else if ([keyPath isEqualToString:@"isAsynchronous"]) {
//            self.asynchronousStatusLabel.text = labelText;
//        }else if ([keyPath isEqualToString:@"isReady"]) {
//            self.readyStatusLabel.text = labelText;
//        }
//        [self.view layoutIfNeeded];
//    }];

}

- (IBAction)startOperation:(id)sender {
    if (self.operation.isExecuting) return;
    if (self.operation == nil || self.operation.isCancelled || self.operation.isFinished) {
        self.operation = [NSBlockOperation blockOperationWithBlock:^{
            int i = 30000;
            while (i-- > 0) {
//                NSLog(@"aaa=%d", i--);
            }
        }];
        self.operation.completionBlock = ^{
            NSLog(@"operation completion");
        };
        [self addKVO];
        NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        [queue addOperation:self.operation];
        NSLog(@"%d,%d,%d,%d,%d", self.operation.isCancelled, self.operation.isExecuting, self.operation.isFinished, self.operation.isAsynchronous, self.operation.isReady);
    }
}

- (IBAction)cancelOperation:(id)sender {
    if (self.operation.isExecuting) {
        NSLog(@"start cancel operation");
        [self.operation cancel];
    }
}

- (NSString *)excuteLoop:(NSNumber *)loopCount {
    NSLog(@"task is in main thread, which is performed:%@", [NSThread isMainThread] ? @"YES" : @"NO");
    NSInteger count = loopCount.integerValue;
    while (count > 0) {
        NSLog(@"count:%ld", count--);
    }
    return @"hello,world";
}
@end

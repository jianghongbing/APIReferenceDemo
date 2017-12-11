//
//  main.m
//  KeyValueObserving
//
//  Created by pantosoft on 2017/12/1.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "BankAccount.h"
#import "Student.h"
#import "ClassTeacher.h"
void KVOSimpleUse(void);
void KVOMaualNotification(void);
void KVOToMany(void);
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //KVO:key value observing,键值观察,当对应key的value发生改变时,会发送消息给被观察的对象,继承自NSObject的对象默认遵守了KVO协议
        //1.KVO的简单使用
        KVOSimpleUse();
        //2.KVO手动通知的实现
        KVOMaualNotification();
        //3.KVO的一对多
    }
    return 0;
}

void KVOSimpleUse(void) {
    //1.注册KVO,被观察的对象需要添加观察者
    BankAccount *account = [[BankAccount alloc] initWithAccountId:@"0001" balance:100.5];
    Person *zhangSan = [[Person alloc] initWithName:@"zhangSan"];
    //参数说明,account:被观察者,zhangsan:观察者,keyPath:需要观察的键路径
    //options:配置的options决定了在观察者实现的KVO方法中,change参数中所包含的值
    //1.1 NSKeyValueObservingOptionNew,将对应的keyPath的新值放到change字典中
    //1.2 NSKeyValueObservingOptionOld,将对应的keyPath的旧值放到change字典中
    //1.3 NSKeyValueObservingOptionInitial,该选项如果被指定,会立即发送一条通知给观察者,如果和NSKeyValueObservingOptionOld一起使用时,立即发送的消息,change中不会包含old的值,之后改变的消息会有old值,如果和NSKeyValueObservingOptionNew一起使用时,立即发送的消息,change中使用的old值,之后改变的消息中会有new值.
    //1.4 NSKeyValueObservingOptionPrior,该选项如果被指定,会在各个通知的前后发送一条消息,也就是当改变对应keyPath的值后,会发送两条消息给观察者,前一个消息中,change中包含一个NSKeyValueChangeNotificationIsPriorKey的值,并且为YES,即使配置了NSKeyValueObservingOptionNew,第一个消息中,不会包含对应的值
    //context:在 observeValueForKeyPath:ofObject:change:context: 传给observer参数的随机数据,通常可做判断使用
    [account addObserver:zhangSan forKeyPath:@"balance" options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionPrior | NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:balanceContext];
    //2.观察者需要实KVO协议中的方法- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context,来响应被监听对象的值的改变
    //修改被监听对象的对应keyPath的值
    [account setValue:@20 forKey:@"balance"];
    [account addBalance:100];
    //        [account addBalance:10];
    //        [account addBalance:-1000];
    //        [account addBalance:100];
    
    //3.获取change中对应key的值
    //3.1 NSKeyValueChangeKindKey,获取keyPath的值改变的方式,对应的是NSKeyValueChange的枚举的值
    //3.1.1 NSKeyValueChangeSetting = 1,设置
    //3.1.2 NSKeyValueChangeInsertion = 2,插入
    //3.1.3 NSKeyValueChangeRemoval = 3, 移除
    //3.1.4NSKeyValueChangeReplacement = 4, 替换
    //NSKeyValueChangeNewKey 获取新值
    //NSKeyValueChangeOldKey 获取旧值
    //NSKeyValueChangeIndexesKey 获取indexes的值
    //NSKeyValueChangeNotificationIsPriorKey 通知是否提前发送,也就是选项是否制定为NSKeyValueObservingOptionPrior
    //4.remove KVO, 在对象dealloc之前,必须要移除之前添加的observer,一般写在对象的dealloc方法中.否则会有异常发生
    [account removeObserver:zhangSan forKeyPath:@"balance" context:balanceContext];
}

void KVOMaualNotification(void) {
    //当被观察者添加观察者时,被观察者和指定的keyPath之间,必须是符合KVC的标准的,否则会抛出NSUnknownKeyException异常.
    //5.KVO的通知发送方式
    //5.1.自动发送:当通过KVC兼容的方式(比如通过setter或者setValue:ForKey,setValue:forKeyPath:)去改变指定的keyPath的值,被观察者默认会自动发送通知
    //5.2.手动发送:有时候用户想自己来手动发送通知给观察者,而不是系统实现的自动发送通知的方式
    //5.2.1通过重写NSObject提供+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key或者++ (BOOL)automaticallyNotifiesObserversForKey(对应keyPath最后的key)的方法,来确保是否有自己来手动发送通知,NO为禁止自动发送通知,YES为可以自动发送通知
    //5.2.2当通过KVC兼容的以外的方式(比如直接通过修改实例变量的值)去修改keyPath的值,系统也不会去自动发送通知
    //5.2.3手动通知的实现(一对一)如下:
    //[self willChangeValueForKey:@"englishScore"];
    //_englishScore = englishScore;
    //[self didChangeValueForKey:@"englishScore"];
    ClassTeacher *classTeacher = [[ClassTeacher alloc] initWithName:@"zhangsan"];
    Student *student = [[Student alloc] initWithName:@"xiaoming"];
    [student addObserver:classTeacher forKeyPath:@"chineseScore" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [student addObserver:classTeacher forKeyPath:@"mathScore" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    [student addObserver:classTeacher forKeyPath:@"englishScore" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    student.chineseScore = 65.0;
    [student changeChineseScore:75.0];//开启了自动通知,但是不是通过KVC兼容的方式来修改keyPath对应的值,而且也没有实现手动通知,因此classTeacher不能接受到KVO的通知
    student.mathScore = 80.0;//禁用掉了自动通知,也没有实现手动通知,因此classTeacher不能接受到KVO的通知
    student.englishScore = 55.0;//不能自动接收通知,但是实现setter方法的手动通知
    [student removeObserver:classTeacher forKeyPath:@"chineseScore"];
    [student removeObserver:classTeacher forKeyPath:@"mathScore"];
    [student removeObserver:classTeacher forKeyPath:@"englishScore"];
}

void KVOToMany(void) {
    
}



//
//  main.m
//  Property
//
//  Created by jianghongbing on 2018/4/7.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+TestCategory.h"
#import "Screen.h"
void memberVariable(void);
void property(void);
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //1.成员变量
        memberVariable();
        //2.属性
        property();

    }
    return 0;
}


void memberVariable(void) {
    //1.成员变量:在定义类的时候,可以为类声明一些成员变量,一般用下滑线开头的方式来定义成员变量(和方法中的参数名作区别)
    Person *aPerson = [[Person alloc] initWithName:@"A" age:10 identifier:@"00a" sex:Woman];
    //访问类中的成员变量,在类的内部可以直接通过成员变量名或者指针表示的形式来设置和获取成员变量的值,在类的外部可以通过以指针表示的形式和配合成员变量的修饰属性来方法
    //成员变量的访问控制修饰符
    //@public:在任何文件中,都通过通过下面的形式来访问和设置成员变量的值
    //@protocted:成员变量的默认修饰符,如果成员变量没有给访问控制修饰符,成员变量自动获取该修饰符,在子类和category中可以访问该成员变量,其他地方无法访问
    //@package:包访问控制,在当前包中的文件中都可以访问
    //@private:私有成员变量,只能在当前文件的.m文件中和category中访问该成员变量,其实在Objective-C中不存在真正意义上的私有变量,Objective-C中的私有变量可以通过KVC的方式来获取和设置该成员变量的值
    NSString *name = aPerson -> _name;
    NSLog(@"name:%@", name);
    aPerson -> _name = @"B";
    Sex sex = aPerson -> _sex;
    NSLog(@"sex:%d, name:%@", sex, aPerson -> _name);
    [aPerson doSomething];
    [aPerson sleep];

    //成员变量学习的总结
    //1.实例变量的声明,实例变量名一般以下划线开头,实例变量,实例变量可以在.h中申明,也可以在.m文件中声明
    //2.实例变量的初始化,如果不直接初始化,如果是继承自NSObject类型会被赋值为nil,如果是c语言的基本类型,int 为0 BOOL为false等
    //3.实例变量的访问权限有4种:具体见上
    //4.实例变量的访问,在内部可以直接使用下划线变量来访问或者使用指针表示法来访问,在外面只能使用指针表示法来访问
    //5.子类中在.h文件中不能和父类有重名的实例变量,但是在.m文件中可以申明和父类同名的变量
    //6.Objective-C中不存在私有变量,在外部文件也可以通过其他的方式(如KVC)去访问@protected @privated 修饰的实例变量
}
void property(void){
    //属性:使用@property来声明一个属性
    //属性的本质:声明属性的同时默认为该属性的对象声明了一个带有下滑的成员变量和setter以及getter方法(编译器添加的)
    Screen *screen = [[Screen alloc] initWithWidth:100.0 height:500.0];
    //通过点语法来设置和访问属性的值
    //获取属性的值时,实际上是通过调用该属性的getter方法来获取该成员变量的值
    CGFloat width = screen.width;
    CGFloat height = screen.height;
    NSLog(@"width:%f, height:%f", width, height);
    //设置属性的值时,实际上是通过调用该属性的setter方法来设置该属性的值
    screen.width = 200;
    screen.height = 400;
    NSLog(@"width:%f, height:%f", screen.width, screen.height);

    //属性生成的实例变量,默认情况下,声明属性的同时,类自动获取一个带有下滑线的该属性名的实例变量
    //实际上生成的实例变量是通过@synthesize来合成的,我们可同过@synthesize来合成自己想要的成员变量名
    //当同时重写了setter和getter方法,编译器将不会自动合成@synthesize width = _width,此时我们需要通过手动来合成
    //属性生成的setter和getter
    //如果属性是自读的,不会生成setter,只会生成getter
    //如果属性是可读写的,会同事生成setter和getter
    //可以通过@dynamic来不让编译器生成setter和getter方法,告诉编译器,setter和getter由开发这来声明,如果没有声明setter和getter,但是通过点语法来访问和设置属性,来发生异常
    




    //属性的修饰符
    //原子性:atomic和nonatomic
    //atomic:原子性的,默认修饰,如果没有设置原子性的修饰符,该属性自动获得atomic的修饰
    //nonatomic:非原子性的


}

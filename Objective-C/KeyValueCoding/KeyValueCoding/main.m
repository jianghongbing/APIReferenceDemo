//
//  main.m
//  KeyValueCoding
//
//  Created by pantosoft on 2017/12/1.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "Teacher.h"
#import "StudentGroup.h"
#import "TeacherGroup.h"
#import "ValidateProperty.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //KVC:键值编码,通过指定的key,间接设置和获取对应的值的机制
        //1.KVC的简单使用
        //1.1 NSDictionary和NSMutableDictionary.NSDictionary因为其不可变,所有不能通过setValue:ForKey的形式来改变指定key的值.NSMutableDictionary则可以通过setValue:ForKey来改变值
        NSDictionary *cities = @{@"wh": @"wuhan", @"bj": @"beijing", @"sh": @"shanghai"};
        NSString *city = [cities valueForKey:@"wh"];
        NSLog(@"city:%@", city);
        NSMutableDictionary *mutableCities = [cities mutableCopy];
        [mutableCities setValue:@"武汉" forKey:@"wh"];
        city = [mutableCities valueForKey:@"wh"];
        NSLog(@"city:%@", city);
        //1.2 NSArray:数组中的对象必须是以key-value的形式存在,当array调用setValueForKey或者valueForKey的时候,会向array中的每一个元素发送setValueForKey或者valueForKey的消息,如果NSArray通过setValueFor:Key的形式来改变元素的值,则元素必须是可变的字典,或者是自定义的对象
        NSArray *cityArray = @[@{@"name": @"wuhan", @"abbr": @"wh"},@{@"name": @"shanghai", @"abbr": @"shanghai"},@{@"name": @"beijing", @"abbr": @"bj"}];
        NSArray *cityNames = [cityArray valueForKey:@"name"];
        NSLog(@"cityArray:%@", cityNames);
        //1.3 NSSet和NSArray的KVC接口是一致的

        //2.自定义对象的KVO的使用
        //系统默认对继承自NSObject的对象通过category的形式实现了NSKeyValueCoding中定义的方法,所以继承自NSObject的对象可以直接使用KVC的方式来设置和获取值
        Student *xiaoMing = [[Student alloc] initWithName:@"xiaoMing"];
        [xiaoMing setValue:@"daMing" forKey:@"name"];
        NSString *name = xiaoMing.name;
        NSLog(@"name:%@", name);
        //3.KVO的实现原理(一对一)
        //3.1 setValue:forKey:
        //3.1.1 当调用setValue:forKey的方法时,会首先去寻找set<Key>或者_set<Key>相关的setter方法,如果有找到则直接调用该方法来赋值
        //3.1.2 如果没有找到,则去看对象的accessInstanceVariablesDirectly是否可以使用KVC来访问实例变量,如果为NO,会调用setValue:forUndefinedKey:(没有定义的key)的方法,系统默认会抛出NSUndefinedKeyException,可以通过重写setValue:forUndefinedKey:来避免
        //3.1.3 如果为YES,则去寻找_<key>, is<Key>,key, _is<Key>等实例变量,如果找到则赋值,如果没有,会调用setValue:forUndefinedKey:(没有定义的key)的方法,系统默认会抛出NSUndefinedKeyException,可以通过重写setValue:forUndefinedKey:来避免
        
        [xiaoMing setValue:@100 forKey:@"studentId"];
        NSInteger studentId = xiaoMing.studentId; //调用setter方法来设置指定key的值
        NSLog(@"studentId:%ld", studentId);
        [xiaoMing setValue:@12 forKey:@"age"];
        NSInteger age = xiaoMing -> _age; //通过实例变量来设置
        NSLog(@"age:%ld", age);
        //通过KVC来设置和获取私有变量
        [xiaoMing setValue:@"123456789" forKey:@"phoneNumber"];
        NSString *phoneNumber = [xiaoMing valueForKey:@"phoneNumber"];
        NSLog(@"phoneNumber:%@", phoneNumber);
        //找不到myAge相关的setter方法和实例变量,会触发setValue:forUndefinedKey:方法,可以通过重写该方法,来防止异常
        [xiaoMing setValue:@17 forKey:@"myAge"];
        //3.2 为某个key设置nil,有的实例变量可以设置nil值,有的不能设置为nil值,如果为不能设置nil值的变量设置了nil值,会产生NSInvalidArgumentException异常
        [xiaoMing setValue:nil forKey:@"phoneNumber"]; //正常,NSString可以赋值为nil
        [xiaoMing setValue:nil forKey:@"age"]; //会抛出异常,基本类型和结构体等非对象类型和集合中元素不能赋值为nil,可以通过重写来避免该异常
        //3.3 valueForKey:方法的实现(一对一的情况)
        //3.3.1 按照get<Key>, <key>, is<Key>, _<key>的顺序寻找相关访问方法,如果有找到则直接调用该方法并获取值
        //3.3.2 如果没有找到,则看对象的类是否允许KVC直接访问实例变量,如果能,则按照_<key>,_is<Key>,<key>,is<Key>的顺序寻找相关实例变量,如果有找到相关实例变量,则直接赋值
        //3.3.3 如果没有找到,则触发valueForUndefinedKey:方法,并且抛出NSUndefinedKeyException异常,可以通过重写来避免该异常
        name = [xiaoMing valueForKey:@"name"];//通过getter方法来获取值
        age = [[xiaoMing valueForKey:@"age"] integerValue]; //通过可访问实例变量来获取值
        NSLog(@"age:%ld", age);
        NSString *myName = [xiaoMing valueForKey:@"myName"]; //通过重写,valueForUndefinedKey:来获取值
        NSLog(@"myName:%@", myName);
//        NSString *yourName = [xiaoMing valueForKey:@"yourName"]; //会产生异常,找不到指定的key
        //4.一次设置多个key的value和获取由多个key-value组成的字典
        Teacher *teacher = [[Teacher alloc] initWithName:@"zhangsan" className:@"classOne"];
        NSDictionary *teacherInfo = @{@"name": @"wangwu", @"className": @"classThree"};
        [teacher setValuesForKeysWithDictionary:teacherInfo];
        NSLog(@"teacher:%@", teacher);
        //等同于上面的setValuesForKeysWithDictionary
//        [teacherInfo enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//            [teacher setValue:obj forKey:key];
//        }];
        NSDictionary *myTeacherInfo = [teacher dictionaryWithValuesForKeys:@[@"name", @"className"]];
        NSLog(@"myTeacherInfo:%@", myTeacherInfo);

        //5.通过keyPath键路径来设置和获取值
        //keyPath的原理:通过路径找到最后一个节点的对象和key,然后调用该对象的setValue:forKey或者valueForKey:来设置和获取对应的值
        //5.1 通过setValue:forKeyPath:来设置值
        xiaoMing.myTeacher = teacher;
        [xiaoMing setValue:@"lisi" forKeyPath:@"myTeacher.name"];
        NSLog(@"teacher:%@", teacher);
        
        //6.KVC的一对多的简单使用,一对多的形式不能通过setValue:ForKey:的形式设置代理对象的值,只能通过一般的setter和相关实例变量来设置值.否之会抛出NSUnknownKeyException
        StudentGroup *group = [[StudentGroup alloc] initWithName:@"gradeOne"];
        Student *studentOne = [[Student alloc] initWithName:@"one"];
        Student *studentTwo = [[Student alloc] initWithName:@"two"];
        Student *studentThree = [[Student alloc] initWithName:@"three"];
        group.allStudents = @[studentOne, studentTwo, studentThree];
        NSArray *students = [group valueForKey:@"students"];
        NSLog(@"students:%@,%p,%p", students, students, group.allStudents);
//        Student *studentFour = [[Student alloc] initWithName:@"four"];
//        Student *studentFive = [[Student alloc] initWithName:@"five"];
//        [group setValue:@[studentFour, studentFive] forKey:@"students"];
//        for (Student *student in group.allStudents) {
//            NSLog(@"student name:%@", student.name);
//        }
        //6.2 KVC的-对多可变数组
        TeacherGroup *teacherGroup = [[TeacherGroup alloc] initWithName:@"teachers"];
        Teacher *teacherOne = [[Teacher alloc] initWithName:@"zhangsan" className:@"gradeOne"];
        Teacher *teacherTwo = [[Teacher alloc] initWithName:@"lisi" className:@"gradeTwo"];
        teacherGroup.allTeachers = @[teacherOne, teacherTwo].mutableCopy;
        //获取值
        NSMutableArray *teachers = [teacherGroup mutableArrayValueForKey:@"teachers"];
        NSLog(@"teachers:%@", teachers);
//        Teacher *teacherThree = [[Teacher alloc] initWithName:@"wangwu" className:@"gradeOne"];
//        Teacher *teacherFour = [[Teacher alloc] initWithName:@"zhaoda" className:@"gradeTwo"];
////        [teacherGroup setValue:@[teacherThree, teacherFour].mutableCopy forKey:@"teachers"];
//        for (Teacher *teacher in teacherGroup.allTeachers) {
//            NSLog(@"teacher name:%@", teacher.name);
//        }
        //6.3间接获取一对多,不可变的值,方法查找的步骤
        //6.3.1按照get<Key>, <key>, is<Key>, _<key>的顺序寻找相关访问方法,如果有找到则直接调用该方法并获取值
        //6.3.2如果没有找到相关的getter方法,就会先查找是否实现了NSArray的代理方法-(NSInteger)countOf<Key>必须要实现,还要实现-(id)objectInStudentsAtIndex:(NSUInteger)index 或者- (NSArray *)studentsAtIndexes:(NSIndexSet *)indexes其中一个方法,如果找到就返回对应的代理对象(NSArray类型或者子类)的值
        //6.3.3如果没有找到,就去找NSSet KVC需要的相关实现,如果找到,就返回代理对象(NSSet类型或者子类)的值
        //6.3.4如果没有找到,则看对象的类是否允许KVC直接访问实例变量,如果能,则按照_<key>,_is<Key>,<key>,is<Key>的顺序寻找相关实例变量,如果有找到相关实例变量,则直接赋值
        //6.3.5 如果没有找到,则触发valueForUndefinedKey:方法,并且抛出NSUnknownKeyException异常
        
        //6.4简介获取一对多,可变集合的值:如mutableArrayValueForKey: 或者mutableArrayValueForKeyPath:
        //6.4.1实现基本和获取一对多,不可变集合的值一直,只是第二步中的需要的实现不一样,如果NSMutableArray需要实现一个删除object的方法和一个insertObject的方法,两者配对,其他的基本一致
        
        //7.Validating Properties:属性验证
        //对象通过validateValue:forKey:error:或者validateValue:forKeyPath:error:来验证某个key的有效性,如果默认没有实现validateKey:error:的方法,系统会默认会返回YES,并且会忽略传入的值和error,可以实现validateKey:error:来实现验证某一个key的有效性
        ValidateProperty *validateProperty = [[ValidateProperty alloc] initWithName:@"jiang" age:12 score:67.9];
        
        NSString *testName = @"";
        NSError *error = nil;
        BOOL isValidate = [validateProperty validateValue:&testName forKey:@"name" error:&error];
        if (error) {
            NSLog(@"error:%@", error);
        }else if (isValidate) {
            NSLog(@"有效的属性");
        }else {
            NSLog(@"testName:%@", testName);
        }
//        isValidate = [validateProperty validateValue:nil forKeyPath:nil error:nil]
        //8.集合操作符在KVC中应用
//        NSArray *numberArray = @[@8, @10, @3];
        
        
        
        
        
        
        
        


        

        
        
        
        
    }
    return 0;
}

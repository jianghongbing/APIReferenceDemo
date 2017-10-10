//
//  main.m
//  NSValue
//
//  Created by jianghongbing on 2017/10/10.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef struct StudentInfo {
    char * name;
    int age;
}StudentInfo;

typedef StudentInfo * PStudentInfo;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSValue:封装基本数据类型和结构体等C语言类型,封装数据类型用NSNumber处理
        StudentInfo student = {"jianghongbing", 27};
        //1.将结构体封装成NSValue类型
        NSValue *value = [NSValue value:&student withObjCType:@encode(StudentInfo)];
        NSLog(@"value:%@", value);
        //2.获取结构体的值
        StudentInfo aStudent;
//        [value getValue:&aStudent size:sizeof(aStudent)];
        [value getValue:&aStudent];
        NSLog(@"name:%s,age:%d", aStudent.name, aStudent.age);
        //3.NSValue的比较
        StudentInfo bStudent = {"jianghongbing", 25};
        NSValue *bValue = [NSValue value:&bStudent withObjCType:@encode(StudentInfo)];
        BOOL isEqual = [value isEqualToValue:bValue];
        NSLog(@"isEqual:%d", isEqual);
        //OC中常用到的一些结构体封装类型,CGSize,CGRect等
        CGSize size = CGSizeMake(100, 100);
        NSValue *sizeValue = [NSValue valueWithSize:size];
        CGSize bSize = [sizeValue sizeValue];
        NSLog(@"bSize:%@", NSStringFromSize(bSize));

        //4.以指针的形式封装成value
        PStudentInfo studentPointer = (PStudentInfo)malloc(sizeof(StudentInfo));
        studentPointer -> name = "jiang";
        studentPointer -> age = 27;

        NSValue *pointerValue = [NSValue valueWithPointer:studentPointer];
        PStudentInfo bStudentPointer = (PStudentInfo)[pointerValue pointerValue];
        NSLog(@"name:%s,age:%d", bStudentPointer -> name, bStudentPointer -> age);
        free(studentPointer);

        //5.将一个object对象封装成NSValue,而不用对其retain,可以将value放入集合中,集合不会对object retain
        NSObject *testObject = [NSObject new];
        NSValue *nonRetainObjectValue = [NSValue valueWithNonretainedObject:testObject];
        NSObject *valueObject = [nonRetainObjectValue nonretainedObjectValue];
        BOOL objectIsEqual = [testObject isEqual:valueObject];
        NSLog(@"objectIsEqual:%d", objectIsEqual);
        NSArray *array = @[nonRetainObjectValue]; //array不会对test object进行引用
        NSObject *arrayObject = [[array firstObject] nonretainedObjectValue];

        NSLog(@"testObject:%p\nvalueObject:%p\narrayObject:%p", testObject, valueObject, arrayObject);



    }
    return 0;
}

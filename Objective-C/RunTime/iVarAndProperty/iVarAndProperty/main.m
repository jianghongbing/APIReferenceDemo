//
//  main.m
//  iVarAndProperty
//
//  Created by pantosoft on 2017/12/21.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"
#import <objc/runtime.h>
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Animal *dog = [[Animal alloc] initWithName:@"ahuang" age:1 weight:2.5];
        //1.获取某个名字对应的ivar
        Ivar nameIvar = class_getInstanceVariable(Animal.class, "_name");
        //2.获取ivar的相关信息
        const char *ivarName = ivar_getName(nameIvar);
        const char *typeEncoding = ivar_getTypeEncoding(nameIvar);
        ptrdiff_t offset = ivar_getOffset(nameIvar);
        printf("ivarName:%s,typeEncoding:%s,offset:%ld\n", ivarName, typeEncoding, offset);
        
        //3.设置和获取类实例对应ivar的值
        NSString *name = object_getIvar(dog, nameIvar);
        NSLog(@"name:%@", name);
        object_setIvar(dog, nameIvar, @"dahuang");
        name = object_getIvar(dog, nameIvar);
        NSLog(@"name:%@", name);
//        object_setIvarWithStrongDefault(nil, nil, nil)
//        name = [dog valueForKey:@"name"];
//        NSLog(@"name:%@", name);
        //4.获取某个类中的所有ivar
        unsigned int count;
        Ivar *ivars = class_copyIvarList(Animal.class, &count);
        NSLog(@"count:%u", count);
        for (int i = 0; i < count; i++) {
            Ivar ivar = ivars[i];
            const char *ivarName = ivar_getName(ivar);
            const char *typeEncoding = ivar_getTypeEncoding(ivar);
            ptrdiff_t offset = ivar_getOffset(ivar);
            printf("ivarName:%s,typeEncoding:%s,offset:%ld\n", ivarName, typeEncoding, offset);
        }
        free(ivars);
        //5.获取property
    }
    return 0;
}

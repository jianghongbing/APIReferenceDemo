//
//  main.m
//  NSExpression
//
//  Created by pantosoft on 2018/5/3.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

#import <Foundation/Foundation.h>
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSExpression:表示一个表达式,常用于NSComparisonPredicate中
        //expression的构建
        NSExpression *expression = [NSExpression expressionWithFormat:@"1 + 2 + 3 * 4"];
        //获取表达式的值,当调用该方法时,会计算出表达式的值,并将其返回
        id result = [expression expressionValueWithObject:nil context:nil];
        NSLog(@"result:%@", result);
        
        expression = [NSExpression expressionWithFormat:@"%@ + %@ - %@ * %@" argumentArray:@[@1, @2, @3, @4]];
        result = [expression expressionValueWithObject:nil context:nil];
        NSLog(@"result:%@", result);
        
        //表达式表示该常量值
        expression = [NSExpression expressionForConstantValue:@"1234"];
        result = [expression expressionValueWithObject:nil context:nil];
        NSLog(@"result:%@", result);
        //一个表达式表示某个对象已经被评估
        expression = [NSExpression expressionForEvaluatedObject];
        //从context字典提取该key对应的值
        expression = [NSExpression expressionForVariable:@"name"];
        result = [expression expressionValueWithObject:nil context:[@{@"name": @"xiaoming", @"age": @10} mutableCopy]];
        NSLog(@"result:%@", result);
        //keyPath,可以从评估的对象中提取对应keyPath的值,如果不存在,则为nil
        expression = [NSExpression expressionForKeyPath:@"name"];
        result = [expression expressionValueWithObject:@{@"name": @"xiaoming", @"age": @10} context:nil];
        NSLog(@"result:%@", result);
        result = [expression expressionValueWithObject:@{@"name01": @"xiaoming", @"age": @10} context:nil];
        NSLog(@"result:%@", result);
        
        //通过函数来定义表达式,函数类型和接受的参数,api文档里面有说明
        expression = [NSExpression expressionForFunction:@"uppercase:" arguments:@[[NSExpression expressionForConstantValue:@"abcedeFG"]]];
        result = [expression expressionValueWithObject:nil context:nil];
        NSLog(@"result:%@", result);
        //求平均数
        expression = [NSExpression expressionForFunction:@"average:" arguments:@[[NSExpression expressionForConstantValue:@[@100, @200, @300, @400]]]];
        result = [expression expressionValueWithObject:nil context:nil];
        NSLog(@"result:%@", result);
        
        //一个包含其他表达式集合的表达式,该表达式评估的结果是其他表达式评估结果的数组
        NSExpression *aExpression = [NSExpression expressionWithFormat:@"1 + 2 + 3 + 4"];
        NSExpression *bExPression = [NSExpression expressionWithFormat:@"1 * 2 * 3 * 4"];
        expression = [NSExpression expressionForAggregate:@[aExpression, bExPression]];
        result = [expression expressionValueWithObject:nil context:nil];
        NSLog(@"result:%@", result);
        
        
        //左右表达式结果的并集,合并连个表达式评估某个对象后获取的结果,左边表达式评估某个对象的结果类型为NSSet,右边可以是所有的集合类型
//        NSArray *peopleListOne = @[@{@"name": @"xiaoming", @"age": @10},
//                                @{@"name": @"daming", @"age": @20},
//                                @{@"name": @"laoming", @"age": @30}];
        NSArray *peopleListTwo = @[@{@"name": @"xiaowang", @"age": @8},
                                   @{@"name": @"dawang", @"age": @18},
                                   @{@"name": @"laowang", @"age": @28}];
        NSExpression *leftExpression = [NSExpression expressionForKeyPath:@"name"];
        NSExpression *rightExpression = [NSExpression expressionForKeyPath:@"age"];
        expression = [NSExpression expressionForUnionSet:leftExpression with:rightExpression];
        result = [expression expressionValueWithObject:peopleListTwo context:nil];
        NSLog(@"result:%@", result);
        //表达式结果的交集
//        expression = [NSExpression expressionForIntersectSet:leftExpression with:rightExpression]
        
        //两个表达式结果做减法
        rightExpression = [NSExpression expressionForAggregate:@[leftExpression, rightExpression]];
        expression = [NSExpression expressionForMinusSet:leftExpression with:rightExpression];
        result = [expression expressionValueWithObject:peopleListTwo context:nil];
        NSLog(@"result:%@", result);
        
//        expression = [NSExpression expressionForFunction:[[NSExpression alloc] init] selectorName:NSStringFromSelector(@selector(evaluateMethod)) arguments:nil];
//        result = [expression expressionValueWithObject:[[TestObject alloc] init] context:nil];
//        NSLog(@"result:%@", result);
        //用于Spotlight
//        expression = [NSExpression expressionForAnyKey];
        
        //通过block来评价某个对象
        expression = [NSExpression expressionForBlock:^id(id evaluatedObject, NSArray<NSExpression *> *expressions, NSMutableDictionary *context) {
            NSLog(@"evaluatedObject:%@, expressions:%@, context:%@", evaluatedObject, expressions, context);
            return nil;
        } arguments:@[[NSExpression expressionForKeyPath:@"name"], [NSExpression expressionForKeyPath:@"age"]]];
        
        result = [expression expressionValueWithObject:peopleListTwo context:nil];
        NSLog(@"result:%@", result);
//        id block = expression.expressionBlock;
//        NSLog(@"block:%@", block);
        //expression 相关属性
//        NSExpressionType expressionType = expression.expressionType;
//        NSString *keyPath = expression.keyPath;
//        NSLog(@"expressionType:%ld, keyPath:%@", expressionType, keyPath);
        
//        @property (nullable, readonly, retain) id constantValue;
//        @property (readonly, copy) NSString *keyPath;
//        @property (readonly, copy) NSString *function;
//        @property (readonly, copy) NSString *variable;
//        @property (readonly, copy) NSExpression *operand;    // the object on which the selector will be invoked (the result of evaluating a key path or one of the defined functions)
//        @property (nullable, readonly, copy) NSArray<NSExpression *> *arguments;    // array of expressions which will be passed as parameters during invocation of the selector on the operand of a function expression
//
//        @property (readonly, retain) id collection API_AVAILABLE(macos(10.5), ios(3.0), watchos(2.0), tvos(9.0));
//        @property (readonly, copy) NSPredicate *predicate API_AVAILABLE(macos(10.5), ios(3.0), watchos(2.0), tvos(9.0));
//        @property (readonly, copy) NSExpression *leftExpression API_AVAILABLE(macos(10.5), ios(3.0), watchos(2.0), tvos(9.0)); // expression which represents the left side of a set expression
//        @property (readonly, copy) NSExpression *rightExpression API_AVAILABLE(macos(10.5), ios(3.0), watchos(2.0), tvos(9.0)); // expression which represents the right side of a set expression
//
//
//        @property (readonly, copy) NSExpression *trueExpression API_AVAILABLE(macos(10.11), ios(9.0), watchos(2.0), tvos(9.0)); // expression which will be evaluated if a conditional expression's predicate evaluates to true
//        @property (readonly, copy) NSExpression *falseExpression API_AVAILABLE(macos(10.11), ios(9.0), watchos(2.0), tvos(9.0)); // expression which will be evaluated if a conditional expression's predicate evaluates to false
//
//        @property (readonly, copy) id (^expressionBlock)(id _Nullable, NSArray<NSExpression *> *, NSMutableDictionary * _Nullable) API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
//
    }
    return 0;
}

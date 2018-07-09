### Category总结
#### Category的作用
1. 为类添加方法.
可以在在不清楚某个类的实现的时候,为该类添加额外的方法
2. 不能为类添加实例变量,通过category添加的属性不会生成实例变量,只会生成对应的setter和getter,并且在Category的实现文件中需要手动实现这两个方法
3. 以Category的形式添加的方法,可能会覆盖类或该类的其他Category中同名的方法,因此声明在Category中声明的方法一般都需要加上前缀


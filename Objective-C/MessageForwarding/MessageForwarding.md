### Objective-C中的消息转发
当某个对象接受到一条消息时(如[obj foo]), Objective-C并不会如同C一样,在编译的时候就绑定好某个函数,而是通过运行时来处理,运行时系统会将其改为objc_msgSend(self,sel,...)的形式,第一个参数是该消息的接受者,第二个参数为消息子,后面的参数为消息的参数.
#### 消息发送的规则和流程
当某个对象接收到一条消息时,运行时会以objc_msgSend(self,sel,...)的形式去调动函数,此时就涉及到查找到正确的函数去调用
1. 查找该对象的方法混缓存表中是否有与该sel匹配的函数,如果有就调用该函数,消息发送完成
2. 如果方法缓存表中没有,就去对象的方法表中寻找,如果找到,就调用,消息发送完成,并将其缓存到方法缓存表中
3. 如果在方法表中没有找到,就去父类的方法表中寻找,如果找到,就调用,消息发送完成,并将其缓存到方法缓存表中,如果没有找到,就去父类的父类中查询,在执行步骤3
4. 一直到根类,如果没有找到与之对应的函数,消息发送进入转发阶段
#### 消息转发阶段,在消息转发阶段,NSObject提供了相关的方法,因此我们可以重写这些方法,来进行拦截,做相关操作
1. 该方法是否已经有实现,涉及到的两个方法:
    + (BOOL)resolveClassMethod:(SEL)sel; //该类方法是否已经有实现
    + (BOOL)resolveInstanceMethod:(SEL)sel; //该实例方法是否已经有实现
    在此阶段,运行时,允许你为该sel提供一个动态实现,在此阶段,我们可以为该sel添加一个IMP,sel和IMP对应,如果没有实现,进入消息转发的下一个阶段
    2. 将方法的处理交给另外一个对象去处理,涉及到的方法:
    - (id)forwardingTargetForSelector:(SEL)aSelector;
    在此阶段我们可以返回一个对象,将aSelector交给返回的对象去处理,如果在此阶段没有处理,进入3
    3. 此阶段与2类似,在此阶段runtime将该sel包装成NSInvocation对象,在此阶段调用NSInvocation对象的相关方法,达到类似2的目的,涉及到的方法
    - (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector,返回一个函数签名信息,如果在此阶段返回的函数签名为nil,会理解调用doesNotRecognizeSelector:,导致不能走到forwardInvocation方法
    - (void)forwardInvocation:(NSInvocation *)anInvocation
    anInvocation包装了methodSignatureForSelector:(SEL)aSelector返回的函数签名的信息,在此阶段,运行时默认实现的forwardInvocation只是调用了doesNotRecognizeSelector方法,如果没有重写forwardInvocation会导致程序崩溃

#### 消息转发过程中的注意点
1. 使用respondsToSelector响应某个消息时,会去获取resolveInstanceMethod的值,因此需要重写respondsToSelector来进行拦截,返回自己想要的结果
    

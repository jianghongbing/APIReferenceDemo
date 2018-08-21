## Block
Block:代码块,C中的语法,和其他语言中的匿名函数,闭包类似.
### Block的特点
1. 将当前上下文中的代码块的代码,保存下来,放到以后某个特定的时间或者上下文中去执行
2. 捕获当前上下文中的变量
3. 对捕获的引用类型的变量强引用
### Block的声明
block的申明类似于C中的指针函数,将指针函数的 * 换成 ^,就可表示一个block变量
### Block的调用:和函数的调用一样
### 使用typedef来定义block类型
block的定义相对于其他类型变量的定义来说,略显麻烦和容易出错,可以使用typedef来定义某个block类型,使用该block类型来声明变量,这种定义block的方式和使用其他类型来定义变量的方式一致
### Block的本质
通过clang -re-write-objc后生成的代码中,可以看出block是一个结构体.定义如下
struct __block_impl {
void *isa; //block的类型的指针
int Flags; 
int Reserved;
void *FuncPtr; //block调用时,执行的函数的指针
};
isa表示block的类型,因此可以将block当成Objective-C中的对象来看待
定义某个block后转换的具体代码
struct __main_block_impl_0 {
struct __block_impl impl;
struct __main_block_desc_0* Desc;
__main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, int flags=0) {
impl.isa = &_NSConcreteStackBlock;
impl.Flags = flags;
impl.FuncPtr = fp;
Desc = desc;
}
};
//将某个block的具体实现,转换成了一个函数指针
static int __main_block_func_0(struct __main_block_impl_0 *__cself, int a, int b) {
return a + b;
}

//block的描述信息
static struct __main_block_desc_0 {
size_t reserved;
size_t Block_size; //block的大小
} __main_block_desc_0_DATA = { 0, sizeof(struct __main_block_impl_0)};
使用typedef定义的block类型,也转变成函数指针类型
typedef int(*SumBlock)(int, int);
### 变量的捕获
1. 局部变量的捕获,block会将其作为常量来处理,如果在block中去修改,会报错.
捕获局部变量转换的代码
struct __main_block_impl_2 {
struct __block_impl impl;
struct __main_block_desc_2* Desc;
int numberTwo;
int numberOne;
__main_block_impl_2(void *fp, struct __main_block_desc_2 *desc, int _numberTwo, int _numberOne, int flags=0) : numberTwo(_numberTwo), numberOne(_numberOne) {
impl.isa = &_NSConcreteStackBlock;
impl.Flags = flags;
impl.FuncPtr = fp;
Desc = desc;
}
};
//由此可知,这是copy不是引用
static int __main_block_func_2(struct __main_block_impl_2 *__cself) {
int numberTwo = __cself->numberTwo; // bound by copy
int numberOne = __cself->numberOne; // bound by copy
return numberTwo - numberOne;
}

2. __block局部变量的捕获
__block变量在运行时,会转换成一个全局的结构体
struct __Block_byref_numberThree_0 {
void *__isa;
__Block_byref_numberThree_0 *__forwarding;
int __flags;
int __size;
int numberThree;
};
该捕获了该变量的block并且引用该结构体
struct __main_block_impl_3 {
struct __block_impl impl;
struct __main_block_desc_3* Desc;
int numberOne;
int numberTwo;
//引用
__Block_byref_numberThree_0 *numberThree; // by ref
__Block_byref_numberFour_1 *numberFour; // by ref
__main_block_impl_3(void *fp, struct __main_block_desc_3 *desc, int _numberOne, int _numberTwo, __Block_byref_numberThree_0 *_numberThree, __Block_byref_numberFour_1 *_numberFour, int flags=0) : numberOne(_numberOne), numberTwo(_numberTwo), numberThree(_numberThree->__forwarding), numberFour(_numberFour->__forwarding) {
impl.isa = &_NSConcreteStackBlock;
impl.Flags = flags;
impl.FuncPtr = fp;
Desc = desc;
}
};
### Block的类型
1. _NSConcreteStackBlock,栈block, 一般默认申明的block都是栈block,该队列的内存管理不需要开发者来处理
2. __NSConcreteGlobalBlock:全局block,将block申明为全局变量时,其类型就是全局block.
3. _NSConcreteMallocBlock:堆上创建的block,内存需要开发者来处理
### Block带来的循环引用
通过__weak来打破block产生的循环引用







### Objective-C对象模型总结
通过clang -rewrite-objc Person.m(指定的.m文件),生成一个Person.cpp的文件,通过cpp文件可以获取到相关的对象模型信息

1. class instance 模型 在.cpp文件没有找到相关定义,在Apple提供的runtime文件中找到了类实例的定义,是一个结构体,里面只有一个isa的成员变量,类型是class类型.其指向自己的类模型
struct objc_object {
Class _Nonnull isa  OBJC_ISA_AVAILABILITY; //
};
2. class类模型
在cpp文件中有一行typedef struct objc_object Person,因此class也被当做对象处理,类对象也是一个结果体,定义如下
struct _class_t {
struct _class_t *isa; //指向自己的metaclass
struct _class_t *superclass; //指向自己的superclass;
void *cache; //
void *vtable; //
struct _class_ro_t *ro; //类模型信息
};
类模型信息的定义如下
struct _class_ro_t {
unsigned int flags;
unsigned int instanceStart;
unsigned int instanceSize; //类实例的大小,占据的字节数,可以当定义好类时,其实例变量的大小已经确定,因此不能通过category来为类扩展实例变量
unsigned int reserved;
const unsigned char *ivarLayout;
const char *name; //类名
const struct _method_list_t *baseMethods; //实例方法列表
const struct _objc_protocol_list *baseProtocols; //遵守的协议列表
const struct _ivar_list_t *ivars; //实例变量列表
const unsigned char *weakIvarLayout;
const struct _prop_list_t *properties; //属性列表
};

每一个类都是一个全局变量,类实例的isa就指向了这个全局变量
extern "C" __declspec(dllexport) struct _class_t OBJC_CLASS_$_Person __attribute__ ((used, section ("__DATA,__objc_data"))) = {
0, // &OBJC_METACLASS_$_Person,
0, // &OBJC_CLASS_$_NSObject,
0, // (void *)&_objc_empty_cache,
0, // unused, was (void *)&_objc_empty_vtable,
&_OBJC_CLASS_RO_$_Person,
};

类的相关信息,可以看出类信息中保存着实例方法列表,实例变量列表,属性列表
static struct _class_ro_t _OBJC_CLASS_RO_$_Person __attribute__ ((used, section ("__DATA,__objc_const"))) = {
0, __OFFSETOFIVAR__(struct Person, _name), sizeof(struct Person_IMPL),
(unsigned int)0,
0,
"Person",
(const struct _method_list_t *)&_OBJC_$_INSTANCE_METHODS_Person,
0,
(const struct _ivar_list_t *)&_OBJC_$_INSTANCE_VARIABLES_Person,
0,
(const struct _prop_list_t *)&_OBJC_$_PROP_LIST_Person,
};


3. metaclass 元类,
通过struct _class_t OBJC_METACLASS_$_Person这行代码,因此也可以将metaclass当成一个类来看待,metaclass也是全局变量,每一个类的isa就指向了metaclass
extern "C" __declspec(dllexport) struct _class_t OBJC_METACLASS_$_Person __attribute__ ((used, section ("__DATA,__objc_data"))) = {
0, // &OBJC_METACLASS_$_NSObject,
0, // &OBJC_METACLASS_$_NSObject,
0, // (void *)&_objc_empty_cache,
0, // unused, was (void *)&_objc_empty_vtable,
&_OBJC_METACLASS_RO_$_Person,
};

元类的相关信息,通过这里可以看出元类保存着类方法
static struct _class_ro_t _OBJC_METACLASS_RO_$_Person __attribute__ ((used, section ("__DATA,__objc_const"))) = {
1, sizeof(struct _class_t), sizeof(struct _class_t),
(unsigned int)0,
0,
"Person",
(const struct _method_list_t *)&_OBJC_$_CLASS_METHODS_Person,
0,
0,
0,
0,
};

通过下面的函数来设置class的相关信息
static void OBJC_CLASS_SETUP_$_Person(void ) {
OBJC_METACLASS_$_Person.isa = &OBJC_METACLASS_$_NSObject; //元类的isa指向了根元类(一般也就是NSObject的元类)
OBJC_METACLASS_$_Person.superclass = &OBJC_METACLASS_$_NSObject; //元类的superclass指向了父类的元类对象
OBJC_METACLASS_$_Person.cache = &_objc_empty_cache;
OBJC_CLASS_$_Person.isa = &OBJC_METACLASS_$_Person; //类的isa指向了元类对象
OBJC_CLASS_$_Person.superclass = &OBJC_CLASS_$_NSObject; //superclass指向了superclass类
OBJC_CLASS_$_Person.cache = &_objc_empty_cache;
}

4. 实例变量模型
struct _ivar_t {
unsigned long int *offset; //变量位置的偏移量
const char *name; //实例变量名
const char *type; //实例变量类型
unsigned int alignment;
unsigned int  size; //实例变量占据的字节大小
};

//类实例变量列表,一个静态变量,classinfo的ivars就指到这里
static struct /*_ivar_list_t*/ {
unsigned int entsize;  // sizeof(struct _prop_t)
unsigned int count;
struct _ivar_t ivar_list[5];
} _OBJC_$_INSTANCE_VARIABLES_Person __attribute__ ((used, section ("__DATA,__objc_const"))) = {
sizeof(_ivar_t),
5,
{{(unsigned long int *)&OBJC_IVAR_$_Person$_name, "_name", "@\"NSString\"", 3, 8},
{(unsigned long int *)&OBJC_IVAR_$_Person$_age, "_age", "q", 3, 8},
{(unsigned long int *)&OBJC_IVAR_$_Person$_height, "_height", "f", 2, 4},
{(unsigned long int *)&OBJC_IVAR_$_Person$_weight, "_weight", "f", 2, 4},
{(unsigned long int *)&OBJC_IVAR_$_Person$_address, "_address", "@\"NSString\"", 3, 8}}
};

5. 属性模型
struct _prop_t {
const char *name; //属性名
const char *attributes;
};
属性列表,class info中的const struct _prop_list_t *properties就指向到这里
static struct /*_prop_list_t*/ {
unsigned int entsize;  // sizeof(struct _prop_t)
unsigned int count_of_properties;
struct _prop_t prop_list[3];
} _OBJC_$_PROP_LIST_Person __attribute__ ((used, section ("__DATA,__objc_const"))) = {
sizeof(_prop_t),
3,
{{"height","Tf,R,N,V_height"},
{"weight","Tf,N,V_weight"},
{"address","T@\"NSString\",C,N,V_address"}}
};
6. 实例方法
将Objective-C中声明的方法转换成C方法
static instancetype _I_Person_initWithName_age_(Person * self, SEL _cmd, NSString *name, NSInteger age) {
self = ((Person *(*)(__rw_objc_super *, SEL))(void *)objc_msgSendSuper)((__rw_objc_super){(id)self, (id)class_getSuperclass(objc_getClass("Person"))}, sel_registerName("init"));
if (self) {
(*(NSString **)((char *)self + OBJC_IVAR_$_Person$_name)) = name;
(*(NSInteger *)((char *)self + OBJC_IVAR_$_Person$_age)) = age;
}
return self;
}

static void _I_Person_eatting(Person * self, SEL _cmd) {
NSLog((NSString *)&__NSConstantStringImpl__var_folders_75_44s8hnzs49z23jl9ftf2km_40000gn_T_Person_4718ea_mi_0);
}


static void _I_Person_runAt_(Person * self, SEL _cmd, NSString *address) {
NSLog((NSString *)&__NSConstantStringImpl__var_folders_75_44s8hnzs49z23jl9ftf2km_40000gn_T_Person_4718ea_mi_1, address);
}
方法列表.class method的method_list_t(const struct _method_list_t *)&_OBJC_$_INSTANCE_METHODS_Person指向这里
static struct /*_method_list_t*/ {
unsigned int entsize;  // sizeof(struct _objc_method)
unsigned int method_count;
struct _objc_method method_list[8];
} _OBJC_$_INSTANCE_METHODS_Person __attribute__ ((used, section ("__DATA,__objc_const"))) = {
sizeof(_objc_method),
8,
{{(struct objc_selector *)"initWithName:age:", "@32@0:8@16q24", (void *)_I_Person_initWithName_age_},
{(struct objc_selector *)"eatting", "v16@0:8", (void *)_I_Person_eatting},
{(struct objc_selector *)"runAt:", "v24@0:8@16", (void *)_I_Person_runAt_},
{(struct objc_selector *)"height", "f16@0:8", (void *)_I_Person_height},
{(struct objc_selector *)"weight", "f16@0:8", (void *)_I_Person_weight},
{(struct objc_selector *)"setWeight:", "v20@0:8f16", (void *)_I_Person_setWeight_},
{(struct objc_selector *)"address", "@16@0:8", (void *)_I_Person_address},
{(struct objc_selector *)"setAddress:", "v24@0:8@16", (void *)_I_Person_setAddress_}}
};

7. 类方法,元对象中保存着类方法
runtime同样将Objective-C中的类方法转换成C方法
static void _C_Person_classTestMethod(Class self, SEL _cmd) {
NSLog((NSString *)&__NSConstantStringImpl__var_folders_75_44s8hnzs49z23jl9ftf2km_40000gn_T_Person_4718ea_mi_2);
}


static NSString * _C_Person_classTestMethod_(Class self, SEL _cmd, NSInteger testInt) {
NSLog((NSString *)&__NSConstantStringImpl__var_folders_75_44s8hnzs49z23jl9ftf2km_40000gn_T_Person_4718ea_mi_3, testInt);
return ((NSString *(*)(id, SEL, NSString *, ...))(void *)objc_msgSend)((id)objc_getClass("NSString"), sel_registerName("stringWithFormat:"), (NSString *)&__NSConstantStringImpl__var_folders_75_44s8hnzs49z23jl9ftf2km_40000gn_T_Person_4718ea_mi_4, (NSInteger)testInt);
}

通metaclass中的_method_list_t方法列表指向这里
static struct _class_ro_t _OBJC_METACLASS_RO_$_Person __attribute__ ((used, section ("__DATA,__objc_const"))) = {
1, sizeof(struct _class_t), sizeof(struct _class_t),
(unsigned int)0,
0,
"Person",
(const struct _method_list_t *)&_OBJC_$_CLASS_METHODS_Person,
0,
0,
0,
0,
};





### NSLayoutConstraint
auto layout引擎在运行时,将一系列的约束(layoutConstraint)转换成某个view在super view中的位置以及其本身的size.使用auto layout布局之前,需要将某个view的translatesAutoresizingMaskIntoConstraints设置为false,来禁用frame布局
layoutConstraint是一个线性的数学表达式,表示两个view之间的相对位置,用于适应不同屏幕大小,不同环境下的布局
用一个表达式来表示某个layoutConstraint
//表示相对关系的constraint
topLayoutConstraint : self.top = super.top * multi + constant 
widthLayout: self.width >= super.width * multi + constant
//表示绝对关系的constraint,只有width和height的layout attribute才能使用,其他的layout attribute不允许使用
height: self.height = 50
***
### NSLayoutConstraint中的角色和相关的类
ItemOne:第一个锚点,其类型只能为UIView, UILayoutGuide.
attributeOne:第一个锚点需要进行约束的attribute, 为NSLayoutConstraintAtrribute的枚举类型
Relation: 第一个锚点的属性和第二个锚点的属性的关心,可以为等于,大于,大于或等于,小于,小于或等于
ItemTwo: 第二个锚点
attributeTwo:第二个锚点的属性
multi:第一个锚点的属性是第二个锚点属性的倍数
constant: 第一个锚点的属性是第二个锚点属性的倍数后额外添加的值
***
#### NSLayoutAtrribute:布局属性
NSLayoutAttributeLeft = 1, //左边,不要使用该属性,当系统语言布局从从左到右切换到从右到左的时候,会出现不符合实际情况的现象,使用NSLayoutAtrributeLeading代替,系统会自动调整满足从右到左的布局
NSLayoutAttributeRight, //右边,使用NSLayoutAtrributeLeading代替,原因同上
NSLayoutAttributeTop, //顶部
NSLayoutAttributeBottom, //底部
NSLayoutAttributeLeading, //前边
NSLayoutAttributeTrailing, //后边
NSLayoutAttributeWidth, //宽度
NSLayoutAttributeHeight, //长度
NSLayoutAttributeCenterX, //x中心
NSLayoutAttributeCenterY, //y中心
NSLayoutAttributeLastBaseline, //最后一行文字的底部
NSLayoutAttributeBaseline = NSLayoutAttributeLastBaseline, //同上
NSLayoutAttributeFirstBaseline, //第一行文字的底部
NSLayoutAttributeLeftMargin, //带有margin的左边
NSLayoutAttributeRightMargin, //带有margin的右边
NSLayoutAttributeTopMargin,//带有margin的顶部
NSLayoutAttributeBottomMargin, //带有margin的底部
NSLayoutAttributeLeadingMargin, //带有margin的前端
NSLayoutAttributeTrailingMargin, //带有margin的后端
NSLayoutAttributeCenterXWithinMargins, //带有margin的x中心
NSLayoutAttributeCenterYWithinMargins, //带有margin的y中心
NSLayoutAttributeNotAnAttribute = 0 //不是一个属性,适用于为某个view设置固定长度的width和height的情况
***
#### NSLayoutRelation:表示布局属性之间的逻辑关系
NSLayoutRelationLessThanOrEqual = -1, //小于或等于
NSLayoutRelationEqual = 0, //等于
NSLayoutRelationGreaterThanOrEqual = 1 //大于或等于
***
#### UILayoutPriorit:布局优先级,用一个数字表示
常用布局优先级
UILayoutPriorityRequired, 值为1000,如果激活了该优先级的constraint,必须起作用,会影响到view的布局
UILayoutPriorityDefaultHigh,值为750,如果激活了该优先级的constraint,不一定起作用,不一定会影响到view的布局.当view的值为1000的constraint能够计算出view的位置和大小,那么该优先级的constraint将不会其作用,如果值为1000的constraint不能够满足,布局引擎将会使用优先级从高到低的非必须实现约束来匹配为满足的布局,如果匹配,该布局生效,影响view的布局
UILayoutPriorityDefaultLow,值为250,应用方式同上
UILayoutPriorityFittingSizeLevel, 适应目标size的优先级
***
#### NSLayoutFormatOptions:位枚举,一组UIView或者UILayoutGuide的对齐方式 使用VFL语言来创建约束,需要用到该类型
NSLayoutFormatAlignAllLeft = (1 << NSLayoutAttributeLeft), //左对齐
NSLayoutFormatAlignAllRight = (1 << NSLayoutAttributeRight), //右对齐
NSLayoutFormatAlignAllTop = (1 << NSLayoutAttributeTop), //上对齐
NSLayoutFormatAlignAllBottom = (1 << NSLayoutAttributeBottom), //下对齐
NSLayoutFormatAlignAllLeading = (1 << NSLayoutAttributeLeading), //前端对齐
NSLayoutFormatAlignAllTrailing = (1 << NSLayoutAttributeTrailing), //后端对齐
NSLayoutFormatAlignAllCenterX = (1 << NSLayoutAttributeCenterX), //x中心对齐
NSLayoutFormatAlignAllCenterY = (1 << NSLayoutAttributeCenterY), //y中心对齐
NSLayoutFormatAlignAllLastBaseline = (1 << NSLayoutAttributeLastBaseline), //最后基线对齐
NSLayoutFormatAlignAllBaseline = NSLayoutFormatAlignAllLastBaseline, //同上
NSLayoutFormatAlignAllFirstBaseline = (1 << NSLayoutAttributeFirstBaseline), //第一基线对齐
NSLayoutFormatAlignmentMask = 0xFFFF, //所有的对齐方式
NSLayoutFormatDirectionLeadingToTrailing = 0 << 16, //从前到后
NSLayoutFormatDirectionLeftToRight = 1 << 16, //从左到右
NSLayoutFormatDirectionRightToLeft = 2 << 16, //从右到左
NSLayoutFormatDirectionMask = 0x3 << 16, //所有的布局方式
NSLayoutFormatSpacingEdgeToEdge = 0 << 19, //使用edge来布局
NSLayoutFormatSpacingBaselineToBaseline = 1 << 19, //基于baseLine布局
NSLayoutFormatSpacingMask = 0x1 << 19, 间距方式
***
### VFL: Visual Format Language,通过视觉化语言来创建NSLayoutConstraint
VFL一些符号的含义
1. I: 竖线表示superView 
2. V:表示垂直方向上的布局
3. H:表示水平方向上的布局,表示水平布局时,H字母可以省略,垂直方向上的V不能省略
4. @: 优先级
***
### 影响AutoLayout的一些属性和方法
1. ins



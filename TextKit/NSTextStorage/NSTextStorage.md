#  NSTextStorage 

NSTextStorage是NSMutableAtrributeString一个半子类化的类,  用于储存需要显示的文本.

## NSTextStorage的方法和属性

* layoutManagers: 与该textStorage关联的所有layoutManager
* addLayoutManager: 添加一个layoutManager
* removeLayoutManager: 移除自定的layoutManager 
*  edited:range:changeInLength: 监听textStorage发生变化, 如果需要监听textStorage发生的变化,可以通过子类并且重写该方法即可. 该方法参数说明如下
    * mask: textStorage改变的类型. 可分为text长度的改变, 文件属性的改变, 通过改变文字的长度和属性
    * oldRange: 发生改变的文字,在发生改变前所在的范围
    * lengthChange: 文字改变的长度
*  editedMask: textStorage的编辑类型.
*  editedRange: textStorage编辑过程中发生改变的范围
*  changeInLength:  textStorage长度的变化.
*  delegate: 代理,用于监听textStorage的改变
*  fixesAttributesLazily: 延迟确定文字属性
*  ensureAttributesAreFixedInRange:  固定指定范围文字的属性
*  invalidateAttributesInRange: 使指定范围的文字属性无效
*  processEditing: 编辑处理, 一般不用直接调用该方法,  通过子类来重写该方法

## NSTextStorage的子类化

如果子类化NSTextStorage, 一般会为该类提供一个NSMutableAttributeString的使用对象作为其储存文本的备份. 如果需要手动改变textStorage, 需要在beginEditing和endEditing方法之间来做这些修改,  让观察者知道textStorage的变化.



### 必须重写的方法

重写这些方法是为了让系统知道哪里发生了改变, 系统便于对这些操作做出相应的动作, 比如delegate方法的回调,通知的发送等.

* string: 返回一个string对象, 一般返回其备份文本的string属性
* attributesAtIndex:effectiveRange: 返回指定范围的文本属性
* replaceCharactersInRange:withString: 用一个string替换自定位置的string
* setAttributes:range: 设置指定范围的文本的attributes




## NSTextStorageDelegate 

* textStorage:willProcessEditing:range:changeInLength: textStorage将要处理编辑的时候的回调
* textStorage:didProcessEditing:range:changeInLength: textStorage处理编辑结束时的回调

## 相关的通知

* NSTextStorageWillProcessEditingNotification: 在textStorage处理编辑结束前的通知
* NSTextStorageDidProcessEditingNotification: 在textStorage处理编辑结束的通知

## NSTextStorageEditActions: 编辑类型

* NSTextStorageEditedAttributes: 文字属性编辑, 修改字符的颜色, 字体等
* NSTextStorageEditedCharacters: 字符编辑, 如添加字符或者删除字符

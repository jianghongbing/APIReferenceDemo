#  NSLayoutManager: 布局管理器

NSLayoutManager用于管理text在textContainer中的布局. 其角色就相当于MVC架构中的C, NSTextStorage相当于M, NSTextContainer和UITextView扮演者V的角色.

## 功能

*  管理textStorage 和 textContainer 
*  使用字符生成字形
* 计算字形的位置信息, 并将其保存下来
* 管理字形和字符的范围
*  绘制字形
* 段落样式管理
* 计算每行文字的区域
* 管理如何断字
* 操作字符及其字符属性

## 方法和属性

* textStorage: textStorage属性
* replaceTextStorage: 更换之前的textStorage
* delegate: layoutManager的代理
* textContainers: 所有添加到layoutManager中的textContainer
* addTextContainer: 添加一个textContainer
* insertTextContainer:atIndex: 在自定的文字插入一个textContainer
* removeTextContainerAtIndex: 移除指定位置的textContainer
* setTextContainer:forGlyphRange:  为已经布局完成的字形设置指定的textContainer
* textContainerChangedGeometry: 使用指定的textContainer的布局信息无效
* textContainerChangedTextView: 指定的textContainer的textView发生了改变
* textContainerForGlyphAtIndex:effectiveRange:  返回指定位置的字形的textContainer
* textContainerForGlyphAtIndex:effectiveRange:withoutAdditionalLayout: 功能同上.
* usedRectForTextContainer:  在指定textContainer中的字形的布局信息


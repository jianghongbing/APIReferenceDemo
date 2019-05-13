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
* allowsNonContiguousLayout: 是否支持不连续的布局, 默认为NO
* hasNonContiguousLayout: 是否有不连续布局的区域
* hyphenationFactor: 连接符因素, 0-1.0之间的数字, 如果布局区域剩下的区域的宽度和该单词的比率小于控制符因素的值, 会使用连字符将该单词连接起来. 尽量少用连字符. 
* showsInvisibleCharacters: 是否显示无形的字符,如空白符
* showsControlCharacters: 是否显示控制字符
* usesFontLeading: 是否使用行间距
* invalidateDisplayForCharacterRange: 使指定字符范围的布局无效, 会使用layoutManager的绘制方法调用.
* invalidateDisplayForGlyphRange: 使指定字形范围的布局无效, 会将该字形标记为需要从新显示, 一般不使用该方法, 使用UIView的setNeedsDisplayInRect.
* invalidateGlyphsForCharacterRange:changeInLength:actualCharacterRange: 使指定范围的字符所缓存的字形无效
* invalidateLayoutForCharacterRange:actualCharacterRange:使用指定范围的布局无效.
* processEditingForTextStorage:edited:range:changeInLength:invalidatedRange: textStorage接收到processEditing消息时, 会通知布局管理器textStorage在执行一个编辑操作
* ensureGlyphsForCharacterRange: 如果指定返回的字符还没有生成字形, 则为其生成字形.
* ensureGlyphsForGlyphRange: 如果指定字形范围没有生成字形, 则为其生成字形
* ensureLayoutForBoundingRect:inTextContainer: 如果指定的textContainer的指定rect还没有布局, 则为其布局.
* ensureLayoutForTextContainer:  如果指定的textContainer还没有布局, 则为其布局
* ensureLayoutForCharacterRange: 如果指定的字符范围还没有布局, 则为其布局
* ensureLayoutForGlyphRange: 如果指定范围字形还没有布局, 则为其生成字形
* glyphGenerator: layoutManger的字形生成器


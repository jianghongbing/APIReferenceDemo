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
* getGlyphsInRange:glyphs:properties:characterIndexes:bidiLevels: 获取指定字符范围的所有字形的数量.
    * range: 传入的字符范围
    * glyphs: 指向字形数组的指针, 将字形填入到该数组中
    * properties: 指向字形属性的数组的指针, 将字形属性填入到该数组中
    * indexes: 字形索引数组的指针
    * bidiLevels: 字形方向数组的指针
* CGGlyphAtIndex: 获取指定位置的字形, 如果index超过字形索引的范围, 会产生异常
* CGGlyphAtIndex:isValidIndex: 获取指定位置的字形, 并判断该索引是由有效. 如果有效, 返回指定位置的字形, isValid改为YES, 如果无效, 返回0, isValid改为0.
* isValidGlyphIndex: 字形索引是否有效.
* numberOfGlyphs: 获取所有字形的数量
* propertyForGlyphAtIndex: 获取指定位置字形的属性
* glyphIndexForCharacterAtIndex: 获取指定字符位置的字形位置
* characterIndexForGlyphAtIndex: 获取指定字形位置的字符位置
* setGlyphs:properties:characterIndexes:font:forGlyphRange: 设置指定的字形的相关属性
  * glyphs: 指向字形数组的指针
  * properties: 字形属性数组的指针
  * indexes: 字形index数组的指针
  * font: 字体数组的指针
  * glyphRange: 字形范围
* setGlyphs:properties:characterIndexes:font:forGlyphRange: 设置指定的字符范围的字形及其属性. 该方法在生成字形的时候自动被文字系统调用, 该方法只能在代理方法layoutManager:shouldGenerateGlyphs:properties:characterIndexes:font:forGlyphRange:中直接调用, 其他地方不能直接调用该方法
* attachmentSizeForGlyphAtIndex: 获取指定字形位置的附件所占位置的大小, 如果该字形不是附件, 返回{-1, -1}
* drawsOutsideLineFragmentForGlyphAtIndex: 绘制的执行是否超过了布局的大小范围
* extraLineFragmentRect: 额外的行的布局范围
* extraLineFragmentTextContainer: 额外的布局范围的文本容器
* extraLineFragmentUsedRect: 封闭额外的布局的rect
* firstUnlaidCharacterIndex: 获取还没有布局的所有字形中的第一个的索引
* getFirstUnlaidCharacterIndex:glyphIndex: 获取第一个还没有布局的字符的索引, 以及其对应的字形索引
* lineFragmentRectForGlyphAtIndex:effectiveRange: 获取指定字形所在行的布局的大小. 也就是绘制该行文字所需要的大小, effectiveRange该行文字的所有字形的范围.
* lineFragmentRectForGlyphAtIndex:effectiveRange:withoutAdditionalLayout: 功能同上. 多了flag参数, 如果该参数为YES, 对应没有生成字形以及布局的字形索引, 不生成字形以及布局, 如果为NO, 则生成字形以及布局
* lineFragmentUsedRectForGlyphAtIndex:effectiveRange: 布局指定字形所在行的文字使用的大小
* lineFragmentUsedRectForGlyphAtIndex:effectiveRange:withoutAdditionalLayout: 功能同上
* locationForGlyphAtIndex: 获取指定字形所在的location.
* notShownAttributeForGlyphAtIndex: 指定位置的字形是否没有显示出来. 比如容器有限, 文字很长的情况下, 后面的文字可能没有显示出来.
* truncatedGlyphRangeInLineFragmentForGlyphAtIndex: 指定字形索引的所在的行的文字是否被截断了
* setAttachmentSize:forGlyphRange: 设置指定字形范围内的附件的布局大小
* setDrawsOutsideLineFragment:forGlyphAtIndex: 指定字形是否绘制在其所在行的范围的外面.
* setExtraLineFragmentRect:usedRect:textContainer: 
* setLineFragmentRect:forGlyphRange:usedRect:  设置指定字符范围所在行的rect和usedRect
* setLocation:forStartOfGlyphRange:  设置指定字形的位置
* setNotShownAttribute:forGlyphAtIndex: 设置指定位置的字形是否可现
* boundingRectForGlyphRange:inTextContainer: 获取在指定的textContainer中指定的字形范围的rect
* characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints: 获取在指定的textContainer中的指定point位置的字符index.
* characterRangeForGlyphRange:actualGlyphRange: 获取指定字形range所对应的字符range.
* enumerateEnclosingRectsForGlyphRange:withinSelectedGlyphRange:inTextContainer:usingBlock: 遍历指定范围的字形所占的rect
* enumerateLineFragmentsForGlyphRange:usingBlock: 遍历每一行文字的rect
* fractionOfDistanceThroughGlyphForPoint:inTextContainer: 指定位置在该字形中的位置和该位置字形的宽度的百分比.
* getLineFragmentInsertionPointsForCharacterAtIndex:alternatePositions:inDisplayOrder:positions:characterIndexes: 获取指定索引字符所在的行的字符输入时光标插入点的位置以及字符的索引. 返回该行所有字符插入点的数量.
* glyphIndexForPoint:inTextContainer: 获取指定point的字形索引
* glyphIndexForPoint:inTextContainer:fractionOfDistanceThroughGlyph: 同上
* glyphRangeForBoundingRect:inTextContainer: 获取指定rect中的所有字形的range
* glyphRangeForBoundingRectWithoutAdditionalLayout:inTextContainer:  获取在指定的textContainer中, 一部分或者全部的字形显示在指定rect中的最小的而且连续的字形的range.
* glyphRangeForTextContainer: 返回指定的textContainer中的字形的range.
* glyphRangeForCharacterRange:actualCharacterRange: 获取指定字符的range对应字形的range.
* rangeOfNominallySpacedGlyphsContainingIndex: 返回包含指定的字形的名义上的所有字形的range.
* drawBackgroundForGlyphRange:atPoint: 绘制某个范围内的所有字形的背景
* drawGlyphsForGlyphRange:atPoint: 绘制某个范围内的所有字形
* drawStrikethroughForGlyphRange:strikethroughType:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin: 绘制删除线
* drawUnderlineForGlyphRange:underlineType:baselineOffset:lineFragmentRect:lineFragmentGlyphRange:containerOrigin: 绘制下划线
* fillBackgroundRectArray:count:forCharacterRange:color: 使用某种颜色来填充字形的背景
* showCGGlyphs:positions:count:font:matrix:attributes:inContext: 显示指定数组内的字形
* strikethroughGlyphRange:strikethroughType:lineFragmentRect:lineFragmentGlyphRange:containerOrigin: 计算和绘制删除线
* underlineGlyphRange:underlineType:lineFragmentRect:lineFragmentGlyphRange:containerOrigin: 计算和绘制删除线

## NSLayoutManagerDelegate 

* layoutManagerDidInvalidateLayout: 使layout无效时的回调
* 









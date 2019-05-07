#  NSTextContainer

文本容器, 用来设置文本显示的区域. 

## NSTextContainer的属性和方法

* layoutManager: 设置与之关联的一个NSLayoutManager对象. 如果想改变关联的layoutManager,  不要直接使用该属性来设置, 通过replaceLayoutManager来替换之前的layoutManager
* replaceLayoutManager: 替换之前的layoutManager
* textView: 与之关联的textView
* size: 容器大小
* exclusionPaths: 不用于显示文本的区域
* lineBreakMode:  当容器的显示所有文字的时候, 最后一行文字的显示模式
* widthTracksTextView:  当textView的宽度发生改变的时候, 宽度是否自适应textView的宽度.
* heightTracksTextView: 当textView的高度发生改变的时候, 高度是否自适应textView的高度
* maximumNumberOfLines: 最大文字行数
* lineFragmentPadding: 文字行的内边距
* lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect: 当自定义自己的textContainer时, 可以通过该方法返回需要的每行文字的rect.
* simpleRectangularTextContainer: 是否是简单的矩形容器.  默认值是YES.  当设置了exclusionPaths或maximumNumberOfLines不为0, 以及自定义textContainer, 并且覆盖了lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect, 可以设置为NO.




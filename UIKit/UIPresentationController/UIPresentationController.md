#  UIPresntationController
用于自定义内容的呈现
## 相关方法和属性
1. init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?)  构造方法
2. delegate, 代理
3. presentingViewController: presented另外一个控制器的控制器
4. presentedViewController: 被present处理的控制器
5. containerView, present和dismiss过程中的根视图,当自定义transition的时候,transitionContext的containerView和该View是同一个对象
6. frameOfPresentedViewInContainerView, 在transition结束后,presentedView的frame,在自定义transition animator的过程中,当为present的时候,通过transitionContext.finalFrame(toViewController)获取的frame是一样的,当为dismiss的时候,通过transitionContext.finalFrame(toViewController)获取的frame是一样的
7. overrideTraitCollection:presentedViewController所在的环境的特征集合
8. ontainerViewWillLayoutSubviews, 将要布局子视图的时候,会回调该方法,可以在该方法中,对子视图进行布局
9. containerViewDidLayoutSubviews, 和UIView的didLayoutSubViews的功能类似,可以在该方法中,对子视图进行布局
10. presentationTransitionWillBegin: presentation将要开始的回调,可以在此方法中,添加额外的自定义视图,以及额外视图需要执行的动画
11. presentationTransitionDidEnd(_ completed: Bool): presentation结束时候的回调,completed表示presentation是否完成,如果没有完成,需要移除添加过的视图
12. dismissalTransitionWillBegin: dimissal将要开始的回调,可以在此方法中,执行额外的动画
13. dismissalTransitionDidEnd(_ completed: Bool): dismissal完成时候的回调,completed表示dismissal是否完成,如果完成,需要移除添加过的视图,可以在该方法中做一些清理工作
14. presentationStyle: presented view controller的presentation样式
15. adaptivePresentationStyle(for: UITraitCollection):在指定环境下的presentation样式
16. adaptivePresentationStyle:适应性样式
17. shouldPresentInFullscreen: presentation是否覆盖整个屏幕, 默认为true
18. shouldRemovePresentersView:在presentation结束后,是否移除presentingViewController的视图,默认为false 


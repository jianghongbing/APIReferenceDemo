//
//  PresentationController.swift
//  UIPresentationController
//
//  Created by pantosoft on 2018/8/17.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class PresentationController: UIPresentationController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
//    lazy var dimmingView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .red
//        view.alpha = 0.0
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapDimmingView(gestureRecognizer:)))
//        view.addGestureRecognizer(tapGestureRecognizer)
//        return view
//    }()
    
    lazy var dimmingView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .extraLight)
//        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.alpha = 0.0
        visualEffectView.backgroundColor = .clear
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapDimmingView(gestureRecognizer:)))
        visualEffectView.addGestureRecognizer(tapGestureRecognizer)
        return visualEffectView
    }()
    
    @objc private func  didTapDimmingView(gestureRecognizer: UITapGestureRecognizer) {
        if gestureRecognizer.state == .recognized {
            presentedViewController.dismiss(animated: true, completion: nil)
        }
    }
    
    //1. initializer
//    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
//        super.init(presentedViewController: presentedViewController, presenting: presentedViewController)
//        presentedViewController.modalPresentationStyle = .custom
//    }
    //2.呈现转场动画开始的时候.可以在该方法中,对子视图自定义动画
    override func presentationTransitionWillBegin() {
        print("func:\(#function),line:\(#line)")
        self.containerView?.addSubview(dimmingView)
        let transitionCoordinator = presentingViewController.transitionCoordinator
        transitionCoordinator?.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 0.35
        }, completion: nil)
    }
    
    //3.呈现转场动画结束的时候, completed:表示转换动画是否完成,yes表示完成,no表示未完成
    override func presentationTransitionDidEnd(_ completed: Bool) {
        print("func:\(#function),line:\(#line)")
        if !completed {
            dimmingView.alpha = 0.0
            dimmingView.removeFromSuperview()
        }
    }
    //4.消失转场动画开始的时候
    override func dismissalTransitionWillBegin() {
        print("func:\(#function),line:\(#line)")
        let transitionCoordinator = presentingViewController.transitionCoordinator
        transitionCoordinator?.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 0.0
        }, completion: nil)
    }
    //5.消失转场动画结束的时候,completed:表示转换动画是否完成,yes表示完成,no表示未完成
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        print("func:\(#function),line:\(#line)")
        if completed {
            dimmingView.removeFromSuperview()
        }
    }
    
    //6.被呈现出来的视图的frame
    override var frameOfPresentedViewInContainerView: CGRect {
        print("func:\(#function),line:\(#line)")
        var rect = containerView!.bounds
        rect.size.height *= 0.5
        return rect
    }
    
    //7. containerView将要布局子视图的时候会回调,可以在该方法中布局自定义视图的位置
    override func containerViewWillLayoutSubviews() {
        print("func:\(#function),line:\(#line)")
        super.containerViewWillLayoutSubviews()
        dimmingView.frame = containerView!.bounds;
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    //8.containerView结束布局子视图的时候会回调,和UIView的didLayoutSubviews的功能类似,也可以在此方法中,来对subView进行布局
    override func containerViewDidLayoutSubviews() {
        print("func:\(#function),line:\(#line)")
    }
    
    
    //MARK: UIViewControllerAnimatedTransitioning
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return self
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    //MARK: UIViewControllerAnimatedTransitioning
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: .from)!
        let toViewController = transitionContext.viewController(forKey: .to)!
        let containerView = transitionContext.containerView
        let duration = transitionDuration(using: transitionContext)
        
        let isPresent = toViewController == presentedViewController
        if isPresent {
            let toView = transitionContext.view(forKey: .to)!
            let toViewFinalFrame = transitionContext.finalFrame(for: toViewController)
            UIView.performWithoutAnimation {
                containerView.addSubview(toView)
                toView.frame = toViewFinalFrame.offsetBy(dx: 0, dy: -toViewFinalFrame.height)
            }
            UIView.animate(withDuration: duration, animations: {
                toView.frame = toViewFinalFrame
            }, completion: { _ in
                let transitionWasCancel = transitionContext.transitionWasCancelled
                if transitionWasCancel {
                    toView.removeFromSuperview()
                }
                transitionContext.completeTransition(!transitionWasCancel)
            })
        } else {
            let fromView = transitionContext.view(forKey: .from)!

            let fromViewInitialFrame = transitionContext.initialFrame(for: fromViewController)
            let fromViewFinalFrame = fromViewInitialFrame.offsetBy(dx: 0, dy: -fromViewInitialFrame.height)
            UIView.animate(withDuration: duration, animations: {
                fromView.frame = fromViewFinalFrame
            }, completion: { _ in
                let transitionWasCancel = transitionContext.transitionWasCancelled
                transitionContext.completeTransition(!transitionWasCancel)
            })
        }
    }
    
}

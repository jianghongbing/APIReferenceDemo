//
//  ViewController.swift
//  UIViewPropertyAnimator
//
//  Created by pantosoft on 2018/5/31.
//  Copyright © 2018年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animateView: UIView!
    private var animator: UIViewPropertyAnimator?
    override func viewDidLoad() {
        super.viewDidLoad()
        //UIViewPropertyAnimator:动画,可动态更改动画属性
        //1.UIViewPropertyAnimator的创建,构造函数,duration:动画时间,curve:动画运动类型(内部是一个控制动画运动的函数),animation:动画体,里面放动画执行的代码
//        let animator = UIViewPropertyAnimator(duration: 2.0, curve: .easeInOut) {
//
//        }
        //自定义动画函数的动画
//        let animator = UIViewPropertyAnimator(duration: 2.0, timingParameters: UITimingCurveProvider)
        //通过controlPoint来获设置动画函数
//        let animator = UIViewPropertyAnimator(duration: 2.0, controlPoint1: CGPoint(x: 0, y: 0), controlPoint2: CGPoint(x: 200, y: 200)) {
//
//        }
        //弹簧动画
//        let animator = UIViewPropertyAnimator(duration: 1.0, dampingRatio: 0.001) {
//
//        }
        
        //UIViewAnimating的相关属性和方法
//        public var state: UIViewAnimatingState { get } //动画的状态
//        public var isRunning: Bool { get } //动画是否正在执行
//        public var isReversed: Bool { get set } //动画是否在反方向上执行
//        public var fractionComplete: CGFloat { get set } //动画完成比率,0.0~1.0之间
//        public func startAnimation() //开始动画
//        public func startAnimation(afterDelay delay: TimeInterval) //在延迟多少秒后,执行动画
//        public func pauseAnimation() //暂停动画
//        public func stopAnimation(_ withoutFinishing: Bool)//停止动画
//        public func finishAnimation(at finalPosition: UIViewAnimatingPosition) //停止动画
        
        
        //UIViewPropertyAnimator的相关属性和方法
//        @NSCopying open var timingParameters: UITimingCurveProvider? { get } //动画控制函数
//        open var duration: TimeInterval { get } //动画时长
//        open var delay: TimeInterval { get } //延迟时间
//        open var isUserInteractionEnabled: Bool //动画过程中,是否允许交互,默认值为NO
//        open var isManualHitTestingEnabled: Bool //动画过程中,是否手动hitTest,默认值为NO
//        open var isInterruptible: Bool //动画是否可以暂停,或停止
//        open var scrubsLinearly: Bool 
//        open var pausesOnCompletion: Bool //动画结束后保持当前状态
//        open func continueAnimation(withTimingParameters parameters: UITimingCurveProvider?, durationFactor: CGFloat) //继续执行动画
    }
    @IBAction func startAnimation(_ sender: Any) {
        let animator = UIViewPropertyAnimator(duration: 5.0, dampingRatio: 1.0) { [unowned self] in
            self.animateView.transform = CGAffineTransform(translationX: 100, y: 0);
        }
        
        //添加动画
        animator.addAnimations {
            self.animateView.backgroundColor = .blue
        }
        
        //添加动画,并且延迟执行,如果动画的时长为5,那么动画在5.0 *delayFactor后执行
        animator.addAnimations({
            [unowned self] in
            let animator = UIViewPropertyAnimator(duration: 2.0, curve: .easeIn) {
                self.animateView.backgroundColor = .red
                self.animateView.transform = .identity
            }
            animator.startAnimation()
        }, delayFactor: 0.5)
        
        
        //动画执行完成后的block
        animator.addCompletion {
            self.animateView.backgroundColor = .orange
            print("animation excute completely:\($0.rawValue)")
        }
        animator.startAnimation()
        self.animator = animator
    }
    
    
    @IBAction func pauseAnimation(_ sender: Any) {
        if let animator = self.animator {
            let state = animator.state
            let isRunning = animator.isRunning
            let isReversed = animator.isReversed
            print("state:\(state.rawValue), isRunning:\(isRunning),isReversed:\(isReversed)")
            if animator.isRunning {
                animator.pauseAnimation()
            }else if !animator.isRunning && animator.state == .active {
                animator.continueAnimation(withTimingParameters: nil, durationFactor: 0);
            }
        }
    }
    @IBAction func endAnimation(_ sender: Any) {
        if let animator = self.animator {
            if animator.isRunning {
                animator.stopAnimation(false)
            }
        }
        self.animateView.transform = .identity
        self.animator = nil;
    }
}


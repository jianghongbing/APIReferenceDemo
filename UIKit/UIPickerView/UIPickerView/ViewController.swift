//
//  ViewController.swift
//  UIPickerView
//
//  Created by pantosoft on 2017/8/22.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //UIPickerView:选择器
        //1.设置dataSource
        pickerView.dataSource = self
        //2.设置delegate 
        pickerView.delegate = self
        //3.是否显示selectionIndicator iOS7之后没有作用,都会显示selectionIndicator
        pickerView.showsSelectionIndicator = true
        
        //7.滚动到自定的row,不会触发delegate的didSelectRow方法
        pickerView.selectRow(3, inComponent: 0, animated: true)
        pickerView.selectRow(8, inComponent: 1, animated: true)
    }
    @IBAction func reloadData(_ sender: Any) {
    }
    @IBAction func printInfo(_ sender: Any) {
        //4.获取picker的components
        let numberOfComponents = pickerView.numberOfComponents
        for i in 0 ..< numberOfComponents {
            //5.获取每个component的row的数量
            let numberOfRowsInComponent = pickerView.numberOfRows(inComponent: i)
            print("numberOfRows:\(numberOfRowsInComponent) InComponent:\(i)")
            //6.获取component的rowSize
            let rowSize = pickerView.rowSize(forComponent: i)
            print("rowSize:\(rowSize)")
        }
        
        //8.获取指定component的选中的row
        let selectedRowInComponentOne = pickerView.selectedRow(inComponent: 0)
        let selectedRowInComponentTwo = pickerView.selectedRow(inComponent: 1)
        print("selectedRow:\(selectedRowInComponentOne), \(selectedRowInComponentTwo)")
        
        
        
    }
}

extension ViewController : UIPickerViewDataSource {
    //1.设置pickerView的components的数量
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //2.设置每个components的行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 5
        }else {
            return 10
        }
    }
}

extension ViewController : UIPickerViewDelegate {
    //1.设置component的widith
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 0 {
            return 100
        }else {
            return 150
        }
    }
    
    //2.设置component的rowd的高度,取最大的rowHeight,作为最终的rowHeight
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        if component == 0 {
            return 44
        }else {
            return 60
        }
    }
    
    //3.设置picker的row的title
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(component)" + "-" + "\(row)"
    }
    
    //4.设置picker的row富文本, 当3,4方法同时实现的时候,下面的会覆盖上面的结果
//    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//        return NSAttributedString(string: "1234")
//    }
    
    //5.自定义picker的row的视图
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let string = "\(component)" + "-" + "\(row)"
        
        if let label = (view as? UILabel) {
            label.text = string
            return label;
        }else {
            let label = UILabel()
            label.text = string
            label.textColor = .white
            label.backgroundColor = .orange
            return label;
        }
    }
    
    //6.选中某一行
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("didSelectRow:\(row), inComponent:\(component)")
    }
}

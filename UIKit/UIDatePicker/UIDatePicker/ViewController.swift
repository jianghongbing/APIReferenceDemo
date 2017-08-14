//
//  ViewController.swift
//  UIDatePicker
//
//  Created by pantosoft on 2017/8/14.
//  Copyright © 2017年 jianghongbing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        //UIDatePicker:时间选择器
        //2.设置datePicker的区域
        datePicker.locale = Locale.current
        //3.设置dataPicker的日历
        datePicker.calendar = Calendar.current
        //4.设置dataPicker的timerzone
        datePicker.timeZone = TimeZone.current
        //5.设置dataPicker的最大和最小日期,当所选的日期大于最大日期或者小于最小日期,datePicker会自动滚到最大日期或者最小日期位置
        let timeInterval:Double = 60 * 60 * 24 * 50
        datePicker.maximumDate = Date(timeIntervalSinceNow: timeInterval)
        datePicker.minimumDate = Date()
        //6.设置倒计时的时长
        datePicker.countDownDuration = 60.0
        //7.设置minuteInterval分钟间隔
        datePicker.minuteInterval = 15
        //8.手动设置dataPicker的时间
//        datePicker.setDate(<#T##date: Date##Date#>, animated: <#T##Bool#>)
        //9.target action 
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
    }
    @IBAction func changeDatePickerMode(_ sender: UISegmentedControl) {
        //1.设置datePicker的模式
        datePicker.datePickerMode = UIDatePickerMode(rawValue: sender.selectedSegmentIndex)!
    }
    
    @objc private func datePickerValueChanged(_ datePicker: UIDatePicker) {
        let date = datePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd hh:mm:ss"
        self.dateLabel.text = dateFormatter.string(from: date)
    }
}


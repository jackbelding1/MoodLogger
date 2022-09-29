//
//  MoodLogViewController.swift
//  MoodLogger
//
//  Created by Jack Belding on 9/27/22.
//
import UIKit

class MoodLogViewController: UIViewController {
    
    @IBOutlet var picker: UIPickerView!
    @IBOutlet var activityPicker: UIPickerView!
    @IBOutlet var sleepHoursPicker: UIPickerView!
    
    let data = ["Apple", "Orange", "Banana", "Grapes", "Strawberries", "Watermelon"]
    let data2 = ["Chicken", "Beef", "Fish", "Pork", "Lamb", "Bison"]
    let hoursOfSleep = ["<4", "5", "6", "7", "8", "9", "10", "11" , "12", ">12"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
        activityPicker.dataSource = self
        activityPicker.delegate = self
        sleepHoursPicker.dataSource = self
        sleepHoursPicker.delegate = self
    }
}
extension MoodLogViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case picker:
            return data.count
        case activityPicker:
            return data2.count
        case sleepHoursPicker:
            return hoursOfSleep.count
        default:
            return 0
        }
    }
    
    
}

extension MoodLogViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case picker:
            return data[row]
        case activityPicker:
            return data2[row]
        case sleepHoursPicker:
            return hoursOfSleep[row]
        default:
            return "null"
        }
    }
}

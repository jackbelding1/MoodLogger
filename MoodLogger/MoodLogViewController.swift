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
    @IBOutlet weak var moodFaceView: UIImageView!
    @IBOutlet weak var activityImage: UIImageView!
    
    let feelings = ["Good", "OK", "Bad"]
    let activities = ["Work", "Leisure", "Exercise"]
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
            return feelings.count
        case activityPicker:
            return activities.count
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
            return feelings[row]
        case activityPicker:
            return activities[row]
        case sleepHoursPicker:
            return hoursOfSleep[row]
        default:
            return "null"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case picker:
            moodFaceView.image = UIImage(named: feelings[row])
            // feeling = Mood.FeelingTag.init(rawValue: Int16(row))
        case activityPicker:
            activityImage.image = UIImage(named: activities[row])
            // activity = Mood.ActivityTag.init(rawValue: Int16(row))
        default:
            return
        }
    }
}

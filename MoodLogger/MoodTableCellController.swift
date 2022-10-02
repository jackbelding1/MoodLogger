//
//  MoodTableCellController.swift
//  MoodLogger
//
//  Created by Jack Belding on 10/1/22.
//

import UIKit
import CoreData

class MoodTableCellViewController: UIViewController {

    let context = (UIApplication.shared.delegate as!
                   AppDelegate).persistentContainer.viewContext
    var moods = Array<Mood>()
    
    @IBOutlet weak var moodLogsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.moodLogsTable.register(MoodTableViewCell.self, forCellReuseIdentifier: "moodCell")
        moodLogsTable.dataSource = self
        moodLogsTable.delegate = self
        moodLogsTable.rowHeight = 150
        fetachData()
        print("entries found: \(moods.count)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetachData()
    }
    
    func fetachData() {
        do {
            moods = try context.fetch(Mood.fetchRequest())
        } catch  { }
        
        moodLogsTable.reloadData()
    }
}
    
//    func retrieveValues() {
//        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
//            let context = appDelegate.persistentContainer.viewContext
//            let fetchRequest = NSFetchRequest<Mood>(entityName: "Mood")
//
//            do {
//                let results = try context.fetch(fetchRequest)
//                for result in results {
//                    let newMood = Mood(context: context)
//                    newMood.sleep = result.sleep
//                    newMood.date = result.date
//                    newMood.feelingValue = result.feelingValue
//                    newMood.activityValue = result.activityValue
//                    moods.append(newMood)
//                }
//            } catch {
//                print("Could not retrieve")
//            }
//        }
//        moodLogsTable.reloadData()
//    }
//}

extension MoodTableCellViewController: UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moodCell", for: indexPath) as! MoodTableViewCell
        let index = moods.count - indexPath.row - 1 //The logs should be displayed from the newset to oldest one.
        let formatter = DateFormatter()
        
        formatter.dateStyle = .full
        formatter.timeStyle = .full
        formatter.locale = Locale(identifier: "en_US")
        
        cell.logDateText.text = formatter.string(from: moods[index].date!)
        var sleepingTime = ""
        switch moods[index].sleep {
        case 0:
            sleepingTime += "<4"
        case 9:
            sleepingTime += ">12"
        default:
            sleepingTime += String(moods[index].sleep + 4)
        }
        cell.logSleepText.text = sleepingTime + " Hours"
//        cell.logFeelingText.text = "\(moods[index].feelingValue)"

        

        
       return cell
    }
    
    
}

extension MoodTableCellViewController: UITableViewDelegate {
    
}

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
    
    @IBOutlet weak var moodLogsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.moodLogsTable.register(MoodTableViewCell.self, forCellReuseIdentifier: "moodCell")
        moodLogsTable.dataSource = self
        moodLogsTable.delegate = self
        moodLogsTable.rowHeight = 150
        retrieveValues()
    }
    
    func retrieveValues() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<Mood>(entityName: "Mood")
            
            do {
                let results = try context.fetch(fetchRequest)
                print("success")
                print("size of DB \(results.count)")

                for result in results {
                    print("result found!")
                    print(result.feelingValue)
                    print(result.activityValue)
                    print(result.sleep)
                    print(result.date)
                }
            } catch {
                print("Could not retrieve")
            }
        }
    }
}

extension MoodTableCellViewController: UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moodCell", for: indexPath) as! MoodTableViewCell

       return cell
    }
    
    
}

extension MoodTableCellViewController: UITableViewDelegate {
    
}

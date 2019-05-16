//
//  RepDetailTableViewController.swift
//  Representative
//
//  Created by Haley Jones on 5/16/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import UIKit

class RepDetailTableViewController: UITableViewController {

    var state: String?
    var reps: [Representative] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let state = state else {return}
        SearchResultController.fetchReps(searchTerm: state) { (results) in
            self.reps = results
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reps.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "repCell", for: indexPath) as? RepTableViewCell else {return UITableViewCell()}
        let cellRep = reps[indexPath.row]
        cell.updateViews(with: cellRep)
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

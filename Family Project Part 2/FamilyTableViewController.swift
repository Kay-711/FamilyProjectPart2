//
//  FamilyTableViewController.swift
//  Family Project Part 2
//
//  Created by Kaylen Ward on 10/31/24.
//

import UIKit

class FamilyTableViewController: UITableViewController {
    
    var familyMembers: [FamilyMember] = [
        FamilyMember(name: "Jesse", emoji: "🧔🏻", relationship: "Father", age: 50, favoriteColor: "Red", hobbies: "Woodworking, boating", photo: "dadPhoto"),
        FamilyMember(name: "Brandi", emoji: "👩🏽", relationship: "Mother", age: 52, favoriteColor: "Blue", hobbies: "Cooking, walking", photo: "momPhoto"),
        FamilyMember(name: "Joel", emoji: "🧑🏿‍🦱", relationship: "Brother-in-law", age: 25, favoriteColor: "Blue", hobbies: "Cooking, studying, basketball", photo: "joelPhoto"),
        FamilyMember(name: "Julia", emoji: "👩🏻", relationship: "Sister", age: 22, favoriteColor: "Pink", hobbies: "Reading, drawing", photo: "juliaPhoto"),
        FamilyMember(name: "Jayson", emoji: "🧑🏽‍🦱", relationship: "Brother", age: 19, favoriteColor: "Green", hobbies: "Running, reading", photo: "jaysonPhoto"),
        FamilyMember(name: "Sean", emoji: "🧑🏻", relationship: "Brother", age: 17, favoriteColor: "Red", hobbies: "Running, playing games", photo: "seanPhoto")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = editButtonItem
        
        tableView.cellLayoutMarginsFollowReadableWidth = true

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBSegueAction func familyMemberDetails(_ coder: NSCoder, sender: Any?) -> DetailsTableViewController? {
        if let cell = sender as? UITableViewCell, let indexPath  = tableView.indexPath(for: cell) {
            let familyMemberDetails = familyMembers[indexPath.row]
            return DetailsTableViewController(coder: coder, familyMember: familyMemberDetails)
        } else {
            return DetailsTableViewController(coder: coder, familyMember: nil)
        }
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return familyMembers.count
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FamilyCell", for: indexPath) as! FamilyTableViewCell
        
        let familyMember = familyMembers[indexPath.row]
        
        // Configure the cell...
        cell.update(with: familyMember)
        cell.showsReorderControl = true

        return cell
    }
    

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            familyMembers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movePerson = familyMembers.remove(at: fromIndexPath.row)
        familyMembers.insert(movePerson, at: to.row)
    }
    

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
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

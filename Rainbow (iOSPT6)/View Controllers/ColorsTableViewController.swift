//
//  ColorsTableViewController.swift
//  Rainbow (iOSPT6)
//
//  Created by Josh Kocsis on 4/7/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import UIKit

class ColorsTableViewController: UITableViewController {
    
    
    var colors: [Color] = [
        Color(colorName: "Red", color: .red),
        Color(colorName: "Orange", color: .orange),
        Color(colorName: "Yellow", color: .yellow),
        Color(colorName: "Green", color: .green),
        Color(colorName: "Blue", color: .blue),
        Color(colorName: "Indigo", color: .cyan),
        Color(colorName: "Violet", color: .purple)
    ]
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return colors.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath)
        
        let color = colors[indexPath.row]
        
        cell.textLabel?.text = color.colorName
        cell.backgroundColor = color.color
        // Configure the cell...
        
        return cell
    }
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ToDetailSegue" {
            
            if let detailVC = segue.destination as? ColorDetailViewController,
                let indexPath = self.tableView.indexPathForSelectedRow {
                detailVC.cellColor = colors[indexPath.row]
            }
        }
        
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
}

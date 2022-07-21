//
//  GlassesTableViewController.swift
//  TrendMedia
//
//  Created by 권민서 on 2022/07/21.
//

import UIKit

class GlassesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
       

    }
    
   
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GlassesTableViewCell.identifier, for: indexPath) as! GlassesTableViewCell
        
        cell.configure()
    
        return cell
    }
    
    
    }

  


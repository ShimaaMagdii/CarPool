//
//  CPListViewController.swift
//  Carpool
//
//  Created by Shimaa Magdi on 7/8/18.
//  Copyright © 2018 Mtribs. All rights reserved.
//

import UIKit

/**
 *     @class CPListViewController
 *  This class is first view controller that has list of car details
 */
class CPListViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Variables
    // Array of placemarks
    internal var dataArray : [CPPlacemarkViewModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 150
        tableView.register(UINib(nibName: CPInfoTableViewCell.ID, bundle: Bundle.main), forCellReuseIdentifier: CPInfoTableViewCell.ID)
        // load Data from Location file
        self.loadData()
        
    }
    
    private func loadData() {
        DispatchQueue.global(qos: .default).async {
            if let placeMarks = CPPlacemarkManager.shared.placeMarks {
                self.dataArray = placeMarks
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    static func create () -> CPListViewController {
        return UIStoryboard(name: StoryboardIdentifier.MainStoryboardIdentifier, bundle: Bundle.main).instantiateViewController(withIdentifier: StoryboardIdentifier.ListVCIdentifier) as! CPListViewController
    }
}

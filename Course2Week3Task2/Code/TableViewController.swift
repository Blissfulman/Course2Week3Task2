//
//  TableViewController.swift
//  Course2Week3Task2
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
    @IBOutlet weak var photoTableView: UITableView!
    
    var photos = PhotoProvider().photos()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoTableView.dataSource = self
        photoTableView.delegate = self
        
        photoTableView.rowHeight = 60
        photoTableView.separatorStyle = .singleLine
        photoTableView.separatorInset = UIEdgeInsets(top: 0, left: 150.0, bottom: 0, right: 0)
        photoTableView.separatorInsetReference = .fromCellEdges
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Photos", for: indexPath) as! PhotoTableViewCell
        cell.fillingCell(photos[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        photoTableView.deselectRow(at: indexPath, animated: true)
        print("Row selected")

    }
}

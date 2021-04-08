//
//  ViewController.swift
//  Youtube Clone
//
//  Created by daffa ahnaf on 17/03/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ModelDelegate {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //mengatur data dirinya sendiri dari ember data(data source) dan pelimpahan(delegate)
        tableView.dataSource = self
        tableView.delegate = self
        
        
        // Do any additional setup after loading the view.
        model.getVideos()
        model.delegate = self
        
    }
    
    //MARK: - Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        self.videos = videos
        
        tableView.reloadData()
    }
    
    //MARK: - TableView Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =
            tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCEL_ID, for: indexPath) as! VideoTableViewCell
        
        //konfigurasi cell dengan data
        let video = self.videos[indexPath.row]
        
        cell.setCell(video)
        
        //mengulang fungsi cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}

        
        
        
        
        
        
    
    // Mark - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
        
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCEL_ID, for: indexPath) as! VideoTableViewCell
            
            // configure the cell with the data
            let video = self.videos[indexPath.row]
            
            cell.setCell(video)
        
        //ejjb
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    }

}


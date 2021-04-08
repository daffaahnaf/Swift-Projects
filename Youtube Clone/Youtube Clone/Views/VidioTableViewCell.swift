//
//  VidioTableViewCell.swift
//  Youtube Clone
//
//  Created by daffa ahnaf on 25/03/21.
//

import UIKit

class VidioTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Inisialisasi
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view
    }
    
    func setCell(_ v:Video){
        
        self.video = v
        
        //Ensure that we have a video
        guard self.video != nil else {
            return
        }
        
        //Set the title
        self.titleLabel.text = video?.title
        
        //Set the data
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        //Set the thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        // Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            //set the thumbnail imageView
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        
        //Downloading the thumbnail data
        let url = URL(string: self.video!.thumbnail)
        
        //Get the shared URL
        let session = URLSession.shared
        
        //Create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                //Save the data in cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                //Check that the doenload url matches the video thumbnail url
                if url!.absoluteString != self.video?.thumbnail {
                    
                    //Video cell has been reycled for another video
                    return
                }
                
                //Crate the image object
                let image = UIImage(data: data!)
                
                // Set imageView
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
                
            }
            
        }
        //Start data task
        dataTask.resume()
    }
    
}

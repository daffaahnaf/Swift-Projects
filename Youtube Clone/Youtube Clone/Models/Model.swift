//
//  Model.swift
//  Youtube Clone
//
//  Created by daffa ahnaf on 19/03/21.
//

import Foundation
protocol ModelDelegate {
    func videosFetched(_ videos:[Video])
}

class Model {
    
    var delegate:ModelDelegate?
    //Fungsi untuk membaca link dari constants
    func getVideos() {
        //Tahap pertama
        let url = URL(string: Constants.API_URL)
        //ini untuk menyimpan data link
        
        guard url != nil else{
            return
        }
        
        //Tahap kedua
        let session = URLSession.shared //pembagian sesi
        
        //Tahap ketiga pembagian tugas
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //cek jika error atau data nya kosong
            if error != nil || data == nil {
                return
            }
            
            do{
                
                //P
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    DispatchQueue.main.async {
                        
                        self.delegate?.videosFetched(response.items!)
                    
                    }
                }
            }
            catch{
                
            }
            
        }
        
        //tahap ke empat..untuk menjalankan tugas
        dataTask.resume()
        
    }
}

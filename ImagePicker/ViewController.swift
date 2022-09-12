//  ViewController.swift
//  ImagePicker


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
 
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    @IBAction func getImageTapped(_ sender: Any) {
        // 1 ) Getting an API
        let API = "https://picsum.photos/300/500"
        
        // 2 ) Creating an URL
        guard let apiURL = URL(string: API) else {
            fatalError ("Some Error")
        }
        
        // 3 ) Initialize session
        let session = URLSession(configuration: .default )
        
        // 4 ) Create query dataTask
        let task = session.dataTask (with: apiURL) { (data, response, error ) in
        // 5 ) process the received data
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                 // data = .jpeg
                self.imageView.image = UIImage (data: data)
               
            }
        }
        // run query
        task.resume()
    
}

}


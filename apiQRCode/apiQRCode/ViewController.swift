//
//  ViewController.swift
//  apiQRCode
//
//  Created by Eros Eloy on 14/03/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var value: UITextField!
 
    
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func chamar(_ sender: Any) {
        requisition(data: value.text!)
    }
    
    func requisition(data: String)
    {
       
        let urlRequest = URLRequest(url: URL(string: "http://api.qrserver.com/v1/create-qr-code/?data="+data+"")!)
        
        let task = URLSession.shared.dataTask(with: urlRequest)
        { (data, _, error) in
            
            
            if let data = data
            {
                DispatchQueue.main.async()
                {
                    [weak self] in
                    self!.image.image = UIImage(data: data)
                }
            }
            
            if let erro = error
            {
                print(erro)
                return
            }
                
            
        }
        task.resume()    }

}


//
//  ViewController.swift
//  ClimaBetin
//
//  Created by Alumno on 18/10/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    
    @IBOutlet weak var lblGrados: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlClima = "http://api.openweathermap.org/data/2.5/weather?q=ciudad+obregon&APPID=3326d4de85a204e001116973cc1e557a&units=metric"
        
        
        Alamofire.request(urlClima).responseJSON { response in
            
            
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


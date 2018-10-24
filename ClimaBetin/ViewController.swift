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

    let urlClima = "https://api.openweathermap.org/data/2.5/weather?q=ciudad+obregon&APPID=3326d4de85a204e001116973cc1e557a&units=metric"
    
    let urlDolar = "https://free.currencyconverterapi.com/api/v6/convert?q=USD_MXN&compact=y"
    
    @IBOutlet weak var lblGrados: UILabel!
    @IBOutlet weak var aiCargarClima: UIActivityIndicatorView!
    
    @IBOutlet weak var lblPrecioDolar: UILabel!
    
    @IBAction func doTapActualizarClima(_ sender: Any) {
        lblGrados.text = "-"
        aiCargarClima.startAnimating()
        Alamofire.request(urlClima).responseJSON { response in
            if let dictRespuesta = response.result.value as? NSDictionary {
                
                if let dictMain = dictRespuesta.value(forKey: "main") as? NSDictionary {
                    
                    if let temp = dictMain.value(forKey: "temp") as?
                        Float {
                        
                        self.lblGrados.text = "\(temp)º"
                        self.aiCargarClima.stopAnimating()
                        
                    }
                    
                }
                
                
            }
            else {
                //Avisarle al usuario que no se pudo leer la respuesta
            }
            
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aiCargarClima.startAnimating()
        
        
        Alamofire.request(urlClima).responseJSON { response in
            if let dictRespuesta = response.result.value as? NSDictionary {
                
                if let dictMain = dictRespuesta.value(forKey: "main") as? NSDictionary {
                    
                    if let temp = dictMain.value(forKey: "temp") as?
                        Float {
                        
                        self.lblGrados.text = "\(temp)"
                        self.aiCargarClima.stopAnimating()
                        
                    }
                    
                }
                
                
            }
            else {
                //Avisarle al usuario que no se pudo leer la respuesta
            }
        }
        
        Alamofire.request(urlDolar).responseJSON { response in
            if let dictRespuesta = response.result.value as? NSDictionary {
                
                if let dictCambio = dictRespuesta.value(forKey: "USD_MXN") as? NSDictionary {
                    
                    if let val = dictCambio.value(forKey: "val") as?
                        Double {
                        
                        self.lblPrecioDolar.text = "\(val)"
                        
                    }
                    
                }
                
                
            }
            else {
                //Avisarle al usuario que no se pudo leer la respuesta
            }
        }
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
        
            

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


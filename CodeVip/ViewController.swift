//
//  ViewController.swift
//  CodeVip
//
//  Created by LAP15335 on 12/09/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var X: UITextField!
    
    @IBOutlet weak var Y: UITextField!
    
    @IBOutlet weak var Z: UITextField!
    
    @IBOutlet weak var K: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getVipDemo(_ sender: Any) {
        let simulatorPage = storyboard?.instantiateViewController(withIdentifier: "Simulator") as! SimulatorViewController
        
        simulatorPage.modalPresentationStyle = .fullScreen
      
        simulatorPage.numberCode = [X.text!,Y.text!,Z.text!,K.text!]
        
        self.present(simulatorPage, animated: true, completion: nil)

    }
    
}


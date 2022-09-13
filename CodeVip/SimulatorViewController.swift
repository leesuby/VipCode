//
//  SimulatorViewController.swift
//  CodeVip
//
//  Created by LAP15335 on 12/09/2022.
//

import UIKit

class SimulatorViewController: UIViewController {

    @IBOutlet weak var X: UILabel!
    var flagXchanges = false
    
    @IBOutlet weak var Y: UILabel!
    var flagYchanges = false
    
    @IBOutlet weak var Z: UILabel!
    var flagZchanges = false
    
    var K : Int = 0
    var numberCode: [String ]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if numberCode != nil{
            X.text = numberCode![0]
            Y.text = numberCode![1]
            Z.text = numberCode![2]
            K = Int(numberCode![3]) ?? 0
            
        
        }

        // Do any additional setup after loading the view.
    }
  
    
    @IBAction func A(_ sender: Any) {
        X.text = "\(Int(X.text!)! + K)"
    }
    
    @IBAction func B(_ sender: Any) {
        Y.text = "\(Int(Y.text!)! + K)"
    }
    
    @IBAction func C(_ sender: Any) {
        Z.text = "\(Int(Z.text!)! + K)"
        
    }
    
    @IBAction func runSimulator(_ sender: Any) {
        usingCode(code: X, delayMillisecond: 300000)
        usingCode(code: Y, delayMillisecond: 200000)
        usingCode(code: Z, delayMillisecond: 100000)
    }
    
    func usingCode(code: UILabel,delayMillisecond: Int){
        //Get number of code
        var numberCode = Int(code.text!)!
        
        DispatchQueue.global().async {
            if(numberCode != 0){
            while(numberCode != 1){
                
                usleep(useconds_t(delayMillisecond))
                
                //Update number of Code after sleep
                DispatchQueue.main.sync {
                    numberCode = Int(code.text!)!
                }
                
                //Calculate RemainCode
                let remain : String = "\(numberCode - Int.random(in: 0..<numberCode))"
                
                //Update UI after calculate
                DispatchQueue.main.sync {
                    code.text = remain
                }
                
                //Update number of Code
                numberCode = Int(remain)!
            }}
            
            DispatchQueue.main.sync {
                code.text = "0"
            }
        }
      
        
    }
    /*
     
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

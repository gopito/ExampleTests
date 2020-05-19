//
//  ViewController.swift
//  Example
//
//  Created by a.smolianin on 16.05.2020.
//  Copyright © 2020 a.smolianin. All rights reserved.
//

import UIKit

class TipCalc {
    var defPerc = 75.0
    
    func calcTip(amount : Double, tipPerc : Double) -> Double {
//        return amount * tipPerc/100.0
        return 0.0
    }
}

class Music {
    var cache : [[String:Any]]?
    var fetchDate : Date?
    
    func refresh() {
        cache = nil
        fetchDate = nil
        fetchMusic { (newData, error) in
            if newData != nil {
                self.fetchDate = Date()
            }
        }
    }
    
    func fetchMusic(completion : @escaping ([[String:Any]]?, Error?)->Void) {
        guard cache == nil else { completion(cache, nil); return }
        
        let dt = URLSession.shared.dataTask(with: URL.init(string: "https://orangevalleycaa.org/api/music")!) { (data, response, error) in
            completion(self.parseJSON(data: data!), error)
        }
        dt.resume()
    }
    
    func parseJSON(data : Data) -> [[String:Any]]? {
        cache = try? JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]]
        return cache
    }
}

class ViewController: UIViewController {

    
    @IBOutlet var lbOutput: UILabel!

    @IBOutlet var tfInput: UITextField!
    @IBAction func btCalc(_ sender: Any) {
        if let val = Double.init(tfInput.text!){
            let tc = TipCalc()
            let tip = tc.calcTip(amount: val, tipPerc: 50.0)
            lbOutput.text = "tip \(tip)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


//
//  DataViewController.swift
//  FirstiOS2021
//
//  Created by Ahmed Qazzaz on 12/04/2021.
//

import UIKit


struct Car {
    var carMan : String
    var carYear : String
    var carBrand : String
}

class DataViewController : UIViewController {
    
    var car : Car!
    
    
    var myCallBack : ((_ selectedElement : String)->Void)?
    
    @IBOutlet weak private var txt_carMan : UILabel!
    @IBOutlet weak private var txt_someText : UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        txt_carMan.text = car.carMan
    }
    
    
    @IBAction func myAction(_ sender : Any?) {
        myCallBack?(txt_someText.text!)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}

//
//  TestingViewController.swift
//  FirstiOS2021
//
//  Created by Ahmed Qazzaz on 07/04/2021.
//

import UIKit

class TestingViewController: UIViewController {

    
    // txt_username
    // btn_submit
    // txv_description
    // seg_gender
    // tbl_firends
    // col_favorites
    
    // usernameTextField
    // submitButton
    // descriptionTextView
    // genderSegmentedController
    // firendsTableView
    // favoritesCollectionView
    
    @IBOutlet weak private var txt_clickHere : UITextField!
    @IBOutlet weak private var imgv_selectedImage : UIImageView!
    @IBOutlet weak private var lb_selectedElement : UILabel!
    
    var selectionList : [[String]] = []
    
    let myPicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txt_clickHere.inputView = myPicker
        
        
//        UIToolbar
//        txt_clickHere.inputAccessoryView
        
        
        myPicker.dataSource = self
        myPicker.delegate = self
        
        let optionsList1 = ["Fiat", "BMW",  "KIA", "Skoda"]
        let optionsList2 = ["2015", "2016", "2017", "2018", "2019", "2020", "2021"]
        selectionList = [optionsList1, optionsList2]

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func moveAction(_ sender : Any?) {
        if !txt_clickHere.text!.isEmpty{
            performSegue(withIdentifier: "moveSegue", sender: self)
        }
        
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return !txt_clickHere.text!.isEmpty
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveSegue" {
            print("We are moving")
        }else if let vc = segue.destination as? DataViewController{
            vc.car = Car(carMan: txt_clickHere.text!, carYear: "", carBrand: "")
            vc.myCallBack = { element in
                self.lb_selectedElement.text = element
            }
            self.view.endEditing(true)
            //vc.carMan = txt_clickHere.text!
        }
    }
    
    @IBAction func doSomethingAction(_ sender : Any?) {
        
//        let textToShare = "Hello, this is my first app"
//        let sharerView = UIActivityViewController(activityItems: [textToShare], applicationActivities: nil)
//        present(sharerView, animated: true, completion: nil)
        
        
//        print(self.navigationController)
        
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "LandingViewController") {
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
        
//        let alert = UIAlertController(title:"Do Something Title", message:"There is nothing I can do for you", preferredStyle: .alert)
//
//
//        let okAction = UIAlertAction(title:"OK", style: .default, handler: { action in
//            print("ok button clicked")
//        })
//
//        alert.addAction(okAction)
//
//        alert.addAction(UIAlertAction(title:"Cancel", style: .cancel, handler: nil))
//
//        alert.addAction(UIAlertAction(title:"DELETE", style: .destructive, handler: { (action) in
//            print("OMG 😱")
//        }))
//
//
//        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func getImageAction(_ sender : UIButton?){
        let alert = UIAlertController(title:"Profile Image", message:"Please choose the source of your profile image", preferredStyle: .actionSheet)
        
        
        let okAction = UIAlertAction(title:"Photo Album", style: .default, handler: { action in
            
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .camera
            imagePicker.delegate = self
            DispatchQueue.main.async {
                self.present(imagePicker, animated: true, completion: nil)
            }
                                    
        })
                                
        alert.addAction(okAction)
        
        alert.addAction(UIAlertAction(title:"Camera", style: .default, handler: { (action) in
            
        }))
        
        alert.addAction(UIAlertAction(title:"Cancel", style: .cancel, handler: nil))
                                
        self.present(alert, animated: true, completion: nil)
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


extension TestingViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("You canceled the operation")
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imgv_selectedImage.image = (info[.originalImage] as? UIImage)
        picker.dismiss(animated: true, completion: nil)
        
        

    }
}

extension TestingViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return selectionList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return selectionList[component].count + 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row == 0 {return "Please Make Selection"}
        
        let item = selectionList[component][row-1]
        return item
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let manIndex = pickerView.selectedRow(inComponent: 0)
        let yearIndex = pickerView.selectedRow(inComponent: 1)
        
        var man = ""
        if manIndex > 0{
            man = selectionList[0][manIndex - 1]
        }
        
        var year = ""
        if yearIndex > 0 {
            year = selectionList[1][yearIndex - 1]
        }
                
        txt_clickHere.text = man + " " + year
        
    }
    
    
}

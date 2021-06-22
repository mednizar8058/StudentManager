//
//  AddStudentsController.swift
//  StudentManager
//
//  Created by MNizar on 6/9/21.
//  Copyright © 2021 MNizar. All rights reserved.
//

import UIKit

class AddStudentsController: UITableViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var lname: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var dateInput: UITextField!
    
    let datePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }
    
    // to present the uiimagepicker
    @IBAction func editProfileImg(_ sender: UIButton) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        present(controller, animated: true, completion: nil)
    }
    
    
    // when the user tap cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //when an image is picked from the gallery
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let img = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        profileImg.image = img
        dismiss(animated: true, completion: nil)
    }
    
    func createDatePicker(){
        
        /*let dateFormatter = DateFormatter()
        DateFormatter.dateFormat(fromTemplate: "MM/DD/YYYY", options: <#T##Int#>, locale: <#T##Locale?#>)*/
        //toolbar to hold Done button
        let toolbar = UIToolbar()
        toolbar.sizeToFit();
        
        //bar button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(didTapDone))
        
        //assign done btn to toolbar
        toolbar.setItems([doneBtn], animated: true)
        
        //assign toolbar
        dateInput.inputAccessoryView = toolbar
        
        //assign datepicker
        dateInput.inputView = datePicker
        
    }
    
    @objc func didTapDone(){
        dateInput.text = "\(datePicker.date)"
        self.view.endEditing(true)
    }
    let student = Student(context:context)
    @IBAction func createNewSrudent(){
        
        student.fname = fname.text
        student.lname = lname.text
        student.age = age.text
        student.profilePic = profileImg.image?.pngData()
        
        do{
            try! context.save()
            print("student saved")
        }
        
        /*let controller:ShowStudentsController = ShowStudentsController()
        controller.showBtn.badgeValue = "1"
        
        */
        
        
    }
    
    
    
    
    
    

    

}

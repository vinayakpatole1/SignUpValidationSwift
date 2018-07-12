//
//  SignUpValidationViewController.swift
//  SignUpValidation
//
//  Created by Apple on 12/07/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class SignUpValidationViewController: UIViewController {

    
    
    @IBOutlet weak var emailtf: UITextField!
    
    @IBOutlet weak var passwordtf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SignUpClicked()
        
       }
    
    func SignUpClicked()
    {
        
    let password = passwordtf.text!
    let emailAddress = emailtf.text?.lowercased()
    let finalEmail = emailAddress?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
    //Email Validation and Alert
        if (isValidEmail(userEmail: finalEmail!) && password.count<=6) {
    
    print("Email is Valid")
    }else
    {
    print("Email is not Valid")
    let myAlert = UIAlertController(title:"Alert",message:"Email ID is not valid",preferredStyle:UIAlertControllerStyle.alert)
    let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
    myAlert.addAction(okAction)
    self.present(myAlert, animated: true, completion: nil)
    
    return
    }
        
    }
    
    //  Email Validation Function
    
    func isValidEmail(userEmail:String) -> Bool {
        
        let emailRegEx = "[A-Za-z0-9.%+-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@",emailRegEx).evaluate(with:userEmail)
    }
    
    // check password length
    
    func passwordLength(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        return newLength <= 10
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}

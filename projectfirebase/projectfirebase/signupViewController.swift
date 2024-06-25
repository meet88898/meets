//
//  signupViewController.swift
//  projectfirebase
//
//  Created by MAC2 on 24/03/1946 Saka.
//

import UIKit
import FirebaseAuth


class signupViewController: UIViewController {

    @IBOutlet weak var txt_username: UITextField!
    
    @IBOutlet weak var txt_password: UITextField!
    
    @IBOutlet weak var btn_signup: UIButton!
    
    @IBOutlet weak var btn_google: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn_signup(_ sender: Any)
    {
        if txt_username.text == "" {
                let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                present(alertController, animated: true, completion: nil)
            
            } else {
                Auth.auth().createUser(withEmail: txt_username.text!, password: txt_password.text!) { (user, error) in
                    
                    if error == nil {
                        print("You have successfully signed up")
                        //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                        
                        let loginvc = self.storyboard?.instantiateViewController(withIdentifier: "loginvc") as! ViewController
                        self.navigationController?.pushViewController(loginvc, animated: true)
                        
                        //self.present(vc!, animated: true, completion: nil)
                        
                    } else {
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
    }
    
    @IBAction func btn_google(_ sender: Any)
    {
         
    }
}

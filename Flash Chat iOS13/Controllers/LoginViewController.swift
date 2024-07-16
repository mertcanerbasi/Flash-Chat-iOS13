//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        guard let email = emailTextfield.text else {
            return
        }

        guard let password = passwordTextfield.text else {
            return
        }

        if email.isEmpty {
            let alertController = UIAlertController(title: "Hata", message: "Email alanı boş bırakılamaz", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(defaultAction)
            present(alertController,animated: true,completion: nil)
        }

        else if password.isEmpty {
            let alertController = UIAlertController(title: "Hata", message: "Şifre alanı boş bırakılamaz", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(defaultAction)
            present(alertController,animated: true,completion: nil)
        }
        else
        {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if error != nil {
                    let alertController = UIAlertController(title: "Hata", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel)
                    alertController.addAction(defaultAction)
                    self.present(alertController,animated: true,completion: nil)
                }
                else {
                    self.performSegue(withIdentifier: K.loginSegue, sender: authResult?.user)
                }
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.loginSegue {
            // Downcast destinationViewController to your specific type
            if let destinationVC = segue.destination as? ChatViewController {
                // Pass data to the destination view controller
                destinationVC.user = sender as? User
            }
        }
    }

}

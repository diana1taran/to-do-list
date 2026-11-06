//
//  ViewController.swift
//  todoList
//
//  Created by Diana Taran on 04.11.2026.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textfield: UITextField!
    
    
    @IBOutlet weak var surname: UITextField!
    
    
    @IBOutlet weak var phone: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTask(_ sender: Any) {
        
        let nameValue = textfield.text!
        let surnameValue = surname.text!
        let phoneValue = phone.text!
        
        let newContact = Contact(name: nameValue, surname: surnameValue, phone: phoneValue)
        
        do {
            var contacts = [Contact]()
            
            if let data = UserDefaults.standard.data(forKey: "contacts") {
                 contacts = try JSONDecoder().decode([Contact].self, from: data)
            }
                contacts.append(newContact)
                
                let encodedata = try JSONEncoder().encode(contacts)
                UserDefaults.standard.set(encodedata, forKey: "contacts")
                
        } catch {
            print("unable to encode \(error)")
        }
        
        
        //        if let taskArray = UserDefaults.standard.array(forKey: "taskArray") as? [String] {
        //            var array = taskArray
        //
        //            array.append(task)
        //
        //            UserDefaults.standard.setValue(array, forKey: "taskArray")
        //
        //        } else {
        //
        //            UserDefaults.standard.setValue([task], forKey: "taskArray")
        //        }
        
        textfield.text = ""
        surname.text = ""
        phone.text = ""
        
    }
}



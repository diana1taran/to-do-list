//
//  PersonViewController.swift
//  todoList
//
//  Created by Diana Taran on 05.11.2026.
//

import UIKit

class PersonViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextfield: UITextField!
    
    
    @IBOutlet weak var surnameTextfield: UITextField!
    
    
    @IBOutlet weak var phoneTextfield: UITextField!
    
    var person = Contact(name: "", surname: "", phone: "")
    var contactIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        nameTextfield.text = person.name
        surnameTextfield.text = person.surname
        phoneTextfield.text = person.phone
    }
    
    
    
    
    @IBAction func editContact(_ sender: Any) {
        
        let name = nameTextfield.text!
        let surname = surnameTextfield.text!
        let phone = phoneTextfield.text!
        
        let editContact = Contact(name: name, surname: surname, phone: phone)
        
        do {
            var contacts = [Contact]()
            
            if let data = UserDefaults.standard.data(forKey: "contacts") {
                 contacts = try JSONDecoder().decode([Contact].self, from: data)
            }
            contacts[contactIndex] = editContact
                
                let encodedata = try JSONEncoder().encode(contacts)
                UserDefaults.standard.set(encodedata, forKey: "contacts")
                
        } catch {
            print("unable to encode \(error)")
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

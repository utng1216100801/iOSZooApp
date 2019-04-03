//
//  ViewController.swift
//  ZooApp
//
//  Created by Usuario invitado on 3/14/19.
//  Copyright © 2019 usuario. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tvListAnimal: UITableView!
    var listOfKillerAnimals = [Animal]()
    var listOfNotKillerAnimals = [Animal]()
    var AnimalType = ["Not killer", "Killer"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        listOfKillerAnimals.append(Animal(name: "ballena", des: "live in ..", image: "ballena"))
        listOfNotKillerAnimals.append(Animal(name: "cangrejo", des: "live in ..", image: "cangrejo"))
        listOfNotKillerAnimals.append(Animal(name: "caracol", des: "live in ..", image: "caracol"))
        listOfKillerAnimals.append(Animal(name: "gorila", des: "live in ..", image: "gorila"))
        listOfKillerAnimals.append(Animal(name: "medusa", des: "live in ..", image: "medusa"))
        listOfNotKillerAnimals.append(Animal(name: "pato", des: "live in ..", image: "pato"))
        listOfKillerAnimals.append(Animal(name: "pulpo", des: "live in ..", image: "pulpo"))
        listOfNotKillerAnimals.append(Animal(name: "venado", des: "live in ..", image: "venado"))
        
        tvListAnimal.delegate = self
        tvListAnimal.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return AnimalType[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return listOfNotKillerAnimals.count
        }else {
            return listOfKillerAnimals.count
        }
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellAnimal:TVCAnimal = tableView.dequeueReusableCell(withIdentifier: "cellAnimal", for: indexPath) as! TVCAnimal
        if indexPath.section == 0{
            cellAnimal.SetAnimal(animal: listOfNotKillerAnimals[indexPath.row])
        }else{
            cellAnimal.SetAnimal(animal: listOfKillerAnimals[indexPath.row])
        }
        
        return cellAnimal
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section==0 {
            print(listOfNotKillerAnimals[indexPath.row].image!)
            listOfNotKillerAnimals.remove(at: indexPath.row)
            //listOfNotKillerAnimals.append(listOfNotKillerAnimals[indexPath.row])
        }else{
            print(listOfKillerAnimals[indexPath.row].name!)
            listOfKillerAnimals.remove(at: indexPath.row)
            //listOfKillerAnimals.append(listOfKillerAnimals[indexPath.row])
        }
        tvListAnimal.reloadData()
    }
}


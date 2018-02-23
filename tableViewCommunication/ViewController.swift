//
//  ViewController.swift
//  tableViewCommunication
//
//  Created by Jeisson Gonzalez on 22/02/18.
//  Copyright © 2018 Jeisson Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var container=[[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.separatorColor = .clear
        
        container.append(["cell":"CellImage","image":UIImage.init(named: "1")!])
        container.append(["cell":"CellTexto"])
        container.append(["cell":"CellTexto"])
        container.append(["cell":"CellTexto"])
        container.append(["cell":"CellButton"])
        container.append(["cell":"CellTexto"])
        container.append(["cell":"CellTexto"])
        container.append(["cell":"CellTexto"])
        container.append(["cell":"CellTexto"])
        container.append(["cell":"CellTexto"])
        container.append(["cell":"CellTexto"])
        container.append(["cell":"CellTexto"])
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return container.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = container[indexPath.row]
        return configure(item, indexPath: indexPath)
    }
    
    func configure(_ item: [String:Any], indexPath: IndexPath) -> UITableViewCell {
        
        let cellName=(item["cell"] as! String)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! tempCell
        cell.delegate = self
        cell.data = item
        
        if cellName == "CellImage" {
            cell.loadImage()
        }else if cellName == "CellTexto" {
            cell.backgroundColor = .red
        }
        
        return cell;
        
    }
    
    func reloadImage(_ image:UIImage) {
        print(image)
        
         container.remove(at: 0)
         container.insert(["cell":"CellImage","image":image], at: 0)
        
        UIView.performWithoutAnimation({
            let loc = tableView.contentOffset
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.reloadRows(at: [indexPath], with: .none)
            tableView.contentOffset = loc
        })
        
        //tableView.reloadData()
        
        
         //let indexPath = IndexPath(row: 0, section: 0)
         //let cell = tableView.cellForRow(at: indexPath) as! tempCell
         //cell.loadImage()
        
        
        DispatchQueue.main.async {
            //self.tableView.reloadData()
            //self.tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return heightForCurrentRow(indexPath)
    }
    
    func heightForCurrentRow(_ indexPath: IndexPath) -> CGFloat{
        
        
        let item = container[indexPath.row]
        
        if (item["cell"] as! String) == "CellImage" {
            return 180
        }else if (item["cell"] as! String) == "CellTexto" {
            return 60
        }else if (item["cell"] as! String) == "CellButton" {
            return 100
        }
        
        return 0
    }
    
}


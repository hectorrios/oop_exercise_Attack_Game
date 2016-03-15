//
//  ViewController.swift
//  oop_exercise
//
//  Created by Hector Rios on 08/03/16.
//  Copyright © 2016 mosby. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: IBOutlets
    
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBOutlet weak var player1ImageView: UIImageView!
    
    
    //MARK: lifecycle funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.lblMessage.text = ""
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


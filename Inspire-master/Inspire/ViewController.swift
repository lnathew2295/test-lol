//
//  ViewController.swift
//  Inspire
//
//  Created by period2 on 11/12/19.
//  Copyright © 2019 period2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 var sources = [[String:String]]()
    @IBOutlet weak var iQuotes: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //control click on folder and create remote
        let query = "https://quote-garden.herokuapp.com/quotes/random"
        
           if let url = URL(string: query)
           {
               if let data  = try? Data(contentsOf: url)
               {
                   let json = try! JSON(data: data)
                   
                   parse(json: json)
               }
           }

    }
    
    
    @IBAction func nextQuote(_ sender: Any)
    {
        let query =  "https://quote-garden.herokuapp.com/quotes/random"
            
               if let url = URL(string: query)
               {
                   if let data  = try? Data(contentsOf: url)
                   {
                       let json = try! JSON(data: data)
                       
                       parse(json: json)
                   }
               }
    }
    func parse (json: JSON)
    {
        for result in json["sources"].arrayValue
        {
        let quoteAuthor = json["qouteAuthor"].stringValue
        let quoteText = json["qouteText"].stringValue
        let id = json["id"].stringValue
//        let message = json["message"].stringValue
        let source = ["qouteAuthor": quoteAuthor, "quoteText": quoteText, "id": id]
        print(source)
        sources.append(source)
        }
        DispatchQueue.global(qos: .userInitiated).async
            {
                
        }
        
    }
//test
}


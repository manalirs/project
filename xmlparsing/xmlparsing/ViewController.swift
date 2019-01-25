//
//  ViewController.swift
//  xmlparsing
//
//  Created by Yuj-admin-mac02 on 17/12/18.
//  Copyright © 2018 Yuj-admin-mac02. All rights reserved.
//

import UIKit
//"https://www.w3schools.com/xml/plant_catalog.xml"

class ViewController: UIViewController,XMLParserDelegate {
    var plantArray=[String]()
    var str:String?
    fileprivate var saxParser:XMLParser?

    override func viewDidLoad() {
        super.viewDidLoad()
        let str = "https://www.w3schools.com/xml/plant_catalog.xml"
        let url = URL(string: str)
        saxParser = XMLParser(contentsOf: url!)
        saxParser?.delegate = self
        saxParser?.parse()
        print(plantArray)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
                     str=String()
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        str?.append(string)
        print(str!)
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
     if(elementName == "ZONE")
     {
        plantArray.append(str!)
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  json
//
//  Created by Yuj-admin-mac02 on 11/12/18.
//  Copyright © 2018 Yuj-admin-mac02. All rights reserved.
//

import UIKit
//https://
//json parsing
class ViewController: UIViewController{
    var nameArray = [String]()
    var nameArray1 = [String]()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlstr = "https://api.github.com/repositories/19438/commits"
        parseJson(urlString: urlstr)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func parseJson(urlString:String)
    {
        
        
        
        enum jsonError:String,Error
        {
        case responseError = "Response not found"
            case dataError = "dat not found"
            case conversionError = "conversion failed"
        }
        guard let endPoint = URL(string: urlString)
            else
        {
            print("end point not found")
            return
        }
        URLSession.shared.dataTask(with: endPoint) {(data, response, error) in
            do
            {
                guard let response1 = response
                    
                else
                {
                    throw jsonError.responseError
                }
                print(response1)
                guard let data = data
                else
                {
                    throw jsonError.dataError
                }
                let firstArray:[[String:Any]] = try JSONSerialization.jsonObject(with: data, options: []) as! [[String : Any]]
                for item in firstArray
                {
                   /* let commitDic:[String:Any] = item["commit"] as![String:Any]
                    let authorDic:[String:Any] = commitDic["author"] as![String:Any]
                    let name:String = authorDic["name"] as!String
                    self.nameArray.append(name)*/
                    let parents:[[String:Any]] = item["parents"]as! [[String:Any]]
                  for item2 in parents
                  {
                    
                    //let zeroDic:[String:Any] = parentsarray["url"]as! [String:Any]
                    let url:String = item2["url"] as! String
                    self.nameArray.append(url)
                
                    }

                    

                }
                print(self.nameArray)
                
            }
            catch let error as jsonError
            {
                print(error.rawValue)
            }
            catch let error as NSError
            {
                print(error.localizedDescription)
            }
          
    }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


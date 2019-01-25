//
//  ViewController.swift
//  JSON1
//
//  Created by Yuj-admin-mac02 on 22/01/19.
//  Copyright © 2019 Yuj-admin-mac02. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = idArray[indexPath.row]
        print("\(cell.textLabel?.text)")
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return idArray.count
    }
    var idArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlStr = "https://api.foursquare.com/v2/venues/search?ll=40.7484,-73.9857&oauth_token=NPKYZ3WZ1VYMNAZ2FLX1WLECAWSMUVOQZOIDBN53F3LVZBPQ&v=20180616"
        parsejson(urlString:urlStr)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var tableview: UITableView!
    func parsejson(urlString:String)
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
                let firstdic:[String:Any] = try JSONSerialization.jsonObject(with: data) as! [String : Any]
                let responseDic : [String:Any] = firstdic["response"] as! [String:Any]
                let venue:[[String:Any]] = responseDic["venues"]as! [[String:Any]]
                for item in venue
                {
                     let name:String = item["name"] as! String
                    print("\(name)")
                    self.idArray.append(name)
                    
                    
                }
                //print(self.nameArray)
               self.tableview.reloadData()
                
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


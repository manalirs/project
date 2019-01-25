//
//  DBWrapper.swift
//  sqlite
//
//  Created by Yuj-admin-mac02 on 18/12/18.
//  Copyright © 2018 Yuj-admin-mac02. All rights reserved.
//

import UIKit
class DBWrapper: NSObject {
    var db : OpaquePointer?
    var stmt : OpaquePointer?
    var taskNameArray: [String]?
    var taskIdArray : [String]?
    static let sharedObject = DBWrapper()
    func getDatabasePath()->String
    {
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path = docDir.first!
        return path + "/myDatabase,sqllite"
    }
    func SelectAllTask(query: String)
    {
        taskNameArray = [String]()
        taskIdArray = [String]()
        let dbPath = getDatabasePath()
        if(sqlite3_open(dbPath, &db) == SQLITE_OK)
            {
                if (sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK)
                {
                    while(sqlite3_step(stmt!) == SQLITE_ROW)
                    {
                        let taskNameInc = sqlite3_column_text(stmt!, 1)
                        let taskName = String(cString: taskNameInc!)
                        let taskIdInc = sqlite3_column_text(stmt!, 0)
                        let taskId = String(cString: taskIdInc!)
                        taskNameArray?.append(taskName)
                        taskIdArray?.append(taskId)
                    }
                    print(taskNameArray!)
                    print(taskIdArray!)
                }
                else
                {
                    print("Error in preparing statement\(sqlite3_errmsg(db!))")
                }
            }
        else
            
            {
            print("Error in opening statement\(sqlite3_errmsg(db!))")
            }
    }
    func executeQuery(query: String)->Bool
    {
        var success:Bool = false
        let dbpath = getDatabasePath()
        if(sqlite3_open(dbpath , &db) == SQLITE_OK)
            {
                if (sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK)
                {
                   if(sqlite3_step(stmt!) == SQLITE_DONE)
                {
                    success = true
                    sqlite3_finalize(stmt!)
                    sqlite3_close(db!)
                    }
                else
                {
                    print("Error in executing statement\(sqlite3_errmsg(db!))")
                }
            }
            else
            
            {
            print("Error in preparing statement\(sqlite3_errmsg(db!))")
            
        }
    }
   else
            {
            print("error noopening stmt \(sqlite3_errmsg(db!))")
        
        }
    return success
}
func createTable()
{
    let createQuery = "create table if not exists taskTable(taskId text,taskName text)"
    let isSuccess = executeQuery(query: createQuery)
    if isSuccess
    {
        print("create:success")
        
    }
    else
    {
        print("create:failed")
    }
    
}

}

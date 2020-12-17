//
//  FactsModel.swift
//  DynamicTable
//
//  Created by Ankita  on 16/12/20.
//  Copyright © 2020 Ankita . All rights reserved.
//

import Foundation

// Create a Model Class to  decode and parse JSON
/*{
"title":"About Canada",
"rows":[
    {
    "title":"Beavers",
    "description":"Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony",
    "imageHref":"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"
    }
    ]
}*/

struct FactModel : Codable{
    
  let heading : String?
  var facts : [Facts]?
  
enum CodingKeys : String, CodingKey {
         case heading = "title"
         case facts = "rows"
    }
init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            facts = try values.decodeIfPresent([Facts].self, forKey: .facts)
            heading = try values.decodeIfPresent(String.self, forKey: .heading)
    }
}



struct Facts : Codable {
 var title : String?
 var description : String?
 var imageUrl : String?
 
 enum CodingKeys : String, CodingKey {
     case title
     case description
     case imageUrl = "imageHref"
  }
 init(from decoder: Decoder) throws {
     let values = try decoder.container(keyedBy: CodingKeys.self)
  //   title = try values.decodeIfPresent(String.self, forKey: .title)
        //   description = try values.decodeIfPresent(String.self, forKey: .description)
   //  imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
    if let title =  try values.decodeIfPresent(String.self, forKey: .title) {
        self.title = title
    }else {
        self.title = ""
    }
    if let description =  try values.decodeIfPresent(String.self, forKey: .description) {
        self.description = description
    }else {
        self.description = ""
    }
    if let imgUrl =  try values.decodeIfPresent(String.self, forKey: .imageUrl) {
        self.imageUrl = imgUrl
    }else {
        self.imageUrl = ""
    }
  }
}

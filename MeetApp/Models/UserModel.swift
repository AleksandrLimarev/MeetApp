//
//  UserModel.swift
//  MeetApp
//
//  Created by Александр Лимарев on 16.11.2022.
//

import Foundation

struct User: Encodable, Decodable{
    var uid:String
    var email:String
    var profileIimageUrl:String
    var username:String
    var searchName:[String]
    var bio:String

}


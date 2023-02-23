//
//  MessageData.swift
//  m3taChatAI
//
//  Created by Bekir Kus on 21.02.23.
//

import Foundation

struct MessageData: Identifiable{
    
    let id = UUID()
    var message: String
    var isResponse: Bool = false
    
}

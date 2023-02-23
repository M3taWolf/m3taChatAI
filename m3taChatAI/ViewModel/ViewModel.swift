//
//  ViewModel.swift
//  m3taChatAI
//
//  Created by Bekir Kus on 10.02.23.
//

import OpenAISwift
import Foundation

final class ViewModel: ObservableObject {
    
    
    init() {}
    
    private var client: OpenAISwift?
      
        func setup() {
            client = OpenAISwift(authToken: "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")
            
        }
        
        func send(text: String, completion: @escaping (String) -> Void) {
            client?.sendCompletion(with: text, maxTokens: 500, completionHandler: { result in
                switch result {
                case .success(let model):
                    let output = model.choices.first?.text ?? ""
                    completion(output)
                case .failure:
                    break
                }
            })
            
        }
    
    
}

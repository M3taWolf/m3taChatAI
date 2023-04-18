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
            client = OpenAISwift(authToken: "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") // <- Your API Key Here
            
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

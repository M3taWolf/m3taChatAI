//
//  NoItemsView.swift
//  m3taChatAI
//
//  Created by Bekir Kus on 23.02.23.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    
    var body: some View {
        ZStack{
            Color(.systemIndigo)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 10) {
                    Text("Let's be PRODUCTIVE!")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.semibold)
                    Text("Fill your 2do List with things you need to get done asap and try to work through it in 24 Hours.")
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                    NavigationLink(destination: AddView(),
                                   label:  {
                        //Image("glass")
                        Text("Add Something")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? Color.mint  : Color.cyan)
                            .cornerRadius(30)
                        
                    })
                    .padding(.horizontal, animate ? 30 : 50)
                    .shadow(
                        color: animate ? Color.gray.opacity(0.7) :
                            Color.black.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
                    
                    
                }
                
                
                .multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform: addAnimation)
                
                
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
    }
        
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
            Animation
                .easeInOut(duration: 2.0)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
        
    }
}



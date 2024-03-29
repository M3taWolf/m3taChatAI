//
//  CustomTabBar.swift
//  m3taChatAI
//
//  Created by Bekir Kus on 11.02.23.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var selectedTab: String
   
    
    // Storing each Tab Midpoint to animate in future
    @State var tabPoints : [String : CGFloat] = [:]
    
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                
               
                // Tab Bar Buttons
                
                TabBarButton(image: "house.fill", selectedTab: $selectedTab, tabPoints: $tabPoints)
                    
                
                TabBarButton(image: "message.fill", selectedTab: $selectedTab, tabPoints: $tabPoints)
                
                
                TabBarButton(image: "list.bullet", selectedTab: $selectedTab, tabPoints: $tabPoints)
                
                
                TabBarButton(image: "gearshape.fill", selectedTab: $selectedTab, tabPoints: $tabPoints)
                
                
                
            }
            .padding()
            .background(
                Color(.systemCyan)
                    .clipShape(TabCurve(tabPoint: getCurvePoint() - 15)))
            .cornerRadius(30)
            .padding(.horizontal)
            
            
        }
    }
    
    // extracting point
    func getCurvePoint() ->CGFloat {
        

        return tabPoints[selectedTab] ?? 300

    }
}

struct CustomTabBar_Previews: PreviewProvider {
    @State static var selectedTab = "house"
    static var previews: some View {
        ContentView()
    }
}

struct TabBarButton: View {
    
    var image: String
    @Binding var selectedTab: String
    @Binding var tabPoints : [String : CGFloat]
    
    var body: some View {
        
        // For getting mid Point of each button for curve Animation
        GeometryReader{reader -> AnyView in
            
            // extracting MidPoint and Storing
            let midX = reader.frame(in: .global).midX
            
            DispatchQueue.main.async {
                tabPoints[image] = midX
            }
           
            return AnyView(
            
                
                Button(action: {
                    
                   // changing tab
                   // spring animation
                        withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)){
                            selectedTab = image
                        }
                    
                       }, label: {
                    
                    // filling the color if it's selected
                      Image(systemName: image)
                        .font(.system(size: 25, weight: .semibold))
                    
                        .foregroundColor(Color.white)
                    // Lifting View
                    // if it's selected
                        .offset(y: selectedTab == image ? -10 : 0)
                    
                    
                })
                // Max Frame
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
        }
        // Max Height
        .frame(height: 50)
    }
}

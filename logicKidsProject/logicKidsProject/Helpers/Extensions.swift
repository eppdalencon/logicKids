//
//  Extensions.swift
//  logicKidsProject
//
//  Created by Eduardo Dalencon on 27/07/23.
//

import SwiftUI

extension View {
    
    func popupNavigatopnView<Content: View>(horizontalPadding:CGFloat = 80, show: Binding<Bool>, @ViewBuilder content: @escaping ()->Content)->some View {
        return self
            .overlay {
                if show.wrappedValue {
                    
                    GeometryReader{proxy in
                        
                       
                        
                        let size = proxy.size
                        
                        VStack{
                            content()
                        }
                        .frame(width: size.width , height: size.height, alignment: .center)
                        .cornerRadius(15)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .background(Color.black.opacity(0.5))
                        
                    }
                }
            }
    }
    func popupNavigatopnViewFull<Content: View>(horizontalPadding:CGFloat = 40, show: Binding<Bool>, @ViewBuilder content: @escaping ()->Content)->some View {
        return self
            .overlay {
                if show.wrappedValue {
                    
                    GeometryReader{proxy in
                        
                       
                        let size = proxy.size
                        
                        VStack{
                            content()
                        }
                     
                        .frame(width: size.width, height: size.height, alignment: .center)
                        .cornerRadius(15)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .background(Color.black.opacity(0.5))
                        
                    }
                }
            }
    }
}

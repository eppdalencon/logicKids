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
                        
                        Color.primary
                            .opacity(0.15)
                            .ignoresSafeArea(.all)
                        
                        let size = proxy.size
                        
                        VStack{
                            content()
                        }
                        .frame(width: size.width - horizontalPadding, height: size.height / 1.5, alignment: .center)
                        .cornerRadius(15)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        
                    }
                }
            }
    }
    func popupNavigatopnViewFull<Content: View>(horizontalPadding:CGFloat = 40, show: Binding<Bool>, @ViewBuilder content: @escaping ()->Content)->some View {
        return self
            .overlay {
                if show.wrappedValue {
                    
                    GeometryReader{proxy in
                        
                        Color.primary
                            .opacity(0.15)
                            .ignoresSafeArea(.all)
                        let size = proxy.size
                        
                        VStack{
                            content()
                        }
                     
                        .frame(width: size.width - horizontalPadding, height: size.height / 1.2, alignment: .center)
                        .cornerRadius(15)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        
                    }
                }
            }
    }
}

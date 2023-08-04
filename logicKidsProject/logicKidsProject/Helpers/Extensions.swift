//
//  Extensions.swift
//  logicKidsProject
//
//  Created by Eduardo Dalencon on 27/07/23.
//

import SwiftUI

//struct VisualEffectView: UIViewRepresentable {
//    var effect: UIVisualEffect?
//    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
//    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
//}

struct BackdropView: UIViewRepresentable {

    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView()
        let blur = UIBlurEffect()
        let animator = UIViewPropertyAnimator()
        animator.addAnimations { view.effect = blur }
        animator.fractionComplete = 0
        animator.stopAnimation(false)
        animator.finishAnimation(at: .current)
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) { }
    
}

/// A transparent View that blurs its background
struct BackdropBlurView: View {
    
    let radius: CGFloat
    
    @ViewBuilder
    var body: some View {
        BackdropView().blur(radius: radius)
    }
    
}

extension View {
    
    func popupNavigatopnView<Content: View>(horizontalPadding:CGFloat = 80, show: Binding<Bool>, @ViewBuilder content: @escaping ()->Content)->some View {
        return self
            .overlay {
                if show.wrappedValue {
                    
                    GeometryReader{proxy in
                        
                       
                        
                        let size = proxy.size
                        
                        ZStack{
                            BackdropBlurView(radius: 6)
//                            VisualEffectView(effect: UIBlurEffect(style: .light))
//                                .edgesIgnoringSafeArea(.all)
                            content()
                        }
                        .frame(width: size.width , height: size.height, alignment: .center)
                        .cornerRadius(15)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        .background(Color.black.opacity(0.5))
                        
                    }
                }
            }
            .ignoresSafeArea(.all)

    }
    func popupNavigatopnViewFull<Content: View>(horizontalPadding:CGFloat = 40, show: Binding<Bool>, @ViewBuilder content: @escaping ()->Content)->some View {
        return self
            .overlay {
                if show.wrappedValue {
                    
                    GeometryReader{proxy in
                        
                       
                        let size = proxy.size
                        
                        ZStack{
                            BackdropBlurView(radius: 6)
//                            VisualEffectView(effect: UIBlurEffect(style: .dark))
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

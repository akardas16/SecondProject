//
//  SlideOverCard.swift
//
//
//  Created by João Gabriel Pozzobon dos Santos on 30/10/20.
//

import SwiftUI


public struct SlideOverCard<Content: View>: View {

    var isPresented: Binding<Bool>
    let onDismiss: (() -> Void)?
    var options: SOCOptions
    let content: Content
    let backgroundColor: Color
    let useMaterialColor:Bool
    let backgroundMaterial: Material
    
    
    public init(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, options: SOCOptions = [], backgroundColor: Color = Color(.systemGray6),useMaterialColor:Bool = false,backgroundMaterial:Material = .ultraThin, content: @escaping () -> Content) {
        self.isPresented = isPresented
        self.onDismiss = onDismiss
        self.options = options
        self.backgroundColor = backgroundColor
        self.backgroundMaterial = backgroundMaterial
        self.useMaterialColor = useMaterialColor
        self.content = content()
    }
 
    @GestureState private var viewOffset: CGFloat = 0.0
    
    var isiPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    public var body: some View {
        ZStack {
            if isPresented.wrappedValue {
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                    .transition(.opacity)
                    .zIndex(1)
                
                Group {
                    if #available(iOS 14.0, *) {
                        container
                            .ignoresSafeArea(.container, edges: .bottom)
                    } else {
                        container
                            .edgesIgnoringSafeArea(.bottom)
                    }
                }.transition(isiPad ? AnyTransition.opacity.combined(with: .offset(x: 0, y: 200)) : .move(edge: .bottom))
                    .zIndex(2)
            }
        }.animation(.spring(response: 0.35, dampingFraction: 1),value: isPresented.wrappedValue)
    }
    
    private var container: some View {
        VStack {
            Spacer()
            
            if isiPad {
                card.aspectRatio(1.0, contentMode: .fit)
                Spacer()
            } else {
                card
            }
        }
    }
    
    private var card: some View {
        VStack(alignment: .trailing, spacing: 0) {
            HStack {
                Capsule(style: .continuous).fill(.white).frame(width: 60, height: 6)
            }.frame(maxWidth: .infinity,alignment: .center)
            if !options.contains(.hideExitButton) {
                Button(action: dismiss) {
                    ExitBtn()
                }.frame(width: 24, height: 24)
            }
          
            
            content
                .padding([.horizontal, options.contains(.hideExitButton) ? .vertical : .bottom], 14)
        }.padding(16)
            .background(content: {
                if useMaterialColor {
                    RoundedRectangle(cornerRadius: 32, style: .continuous)
                        .fill(backgroundMaterial)
                }else {
                    RoundedRectangle(cornerRadius: 32, style: .continuous)
                        .fill(backgroundColor)
                }
            })
        .clipShape(RoundedRectangle(cornerRadius: 32, style: .continuous))
        .offset(x: 0, y: viewOffset/pow(2, abs(viewOffset)/500+1))
        .gesture(
            options.contains(.disableDrag) ? nil :
                DragGesture()
                .updating($viewOffset) { value, state, transaction in
                    state = value.translation.height
                }
                .onEnded() { value in
                    if value.predictedEndTranslation.height > 175 && !options.contains(.disableDragToDismiss) {
                        dismiss()
                    }
                }
        )
    }
    
    func dismiss() {
        withAnimation {
            isPresented.wrappedValue = false
        }
        if (onDismiss != nil) { onDismiss!() }
    }
}

public struct SOCOptions: OptionSet {
    public let rawValue: Int8
    
    public init(rawValue: Int8) {
        self.rawValue = rawValue
    }
    
    public static let disableDrag = SOCOptions(rawValue: 1)
    public static let disableDragToDismiss = SOCOptions(rawValue: 1 << 1)
    public static let hideExitButton = SOCOptions(rawValue: 1 << 2)
}

struct SlideOverCard_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
        PreviewWrapper().environment(\.colorScheme, .dark)
    }
    
    struct PreviewWrapper: View {
        @State var isPresented = true
        
        @State var disableDrag = false
        @State var disableDragToDismiss = false
        @State var hideExitButton = false
        
        var options: SOCOptions {
            var options = SOCOptions()
            if disableDrag { options.insert(.disableDrag) }
            if disableDragToDismiss { options.insert(.disableDragToDismiss) }
            if hideExitButton { options.insert(.hideExitButton) }
            return options
        }
        
        var body: some View {
            ZStack {
                Color(.systemBackground).edgesIgnoringSafeArea(.all)
                VStack {
                    Button("Show card", action: {
                        
                        isPresented = true
                    })
                    
                    Toggle("Disable drag", isOn: $disableDrag)
                    Toggle("Disable drag to dismiss", isOn: $disableDragToDismiss)
                    Toggle("Hide exit button", isOn: $hideExitButton)
                }.padding()
                
                SlideOverCard(isPresented: $isPresented,backgroundColor: Color.cyan) {
                    PlaceholderContent(isPresented: $isPresented)
                }.animation(.spring(response: 0.35, dampingFraction: 1),value: isPresented)
            }
        }
    }
    
    struct PlaceholderContent: View {
        @Binding var isPresented: Bool
        
        var body: some View {
            VStack(alignment: .center, spacing: 25) {
                VStack {
                    Text("Large title").font(.system(size: 28, weight: .bold))
                    Text("A nice and brief description")
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0, style: .continuous).fill(Color.gray)
                    Text("Content").foregroundColor(.white)
                }
                
                VStack(spacing: 8) {
                    Button("Do something", action: {
                        isPresented = false
                    })
                    Button("Just skip it", action: {
                        isPresented = false
                    }).foregroundColor(.white).padding().background {
                        Color.blue.cornerRadius(12)
                    }
                }
            }.frame(height: 480)
        }
    }
}

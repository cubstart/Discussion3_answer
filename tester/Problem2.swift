//
//  Problem2.swift
//  Discussion3
//
//  Created by Dylan Chhum on 2/18/25.
//

import SwiftUI

struct Journal: View {
   @State var text = ""
    
    var body: some View {
        VStack {
            ScrollView {
                HStack(alignment: .center) {
                    TextField("Vent", text: $text)
                        .bold()
                }
            }
            
        }
    }
}

struct Valentines: View {
    @State var show: Bool = false
    var body: some View {
        Heart(show: $show)
            .sheet(isPresented: $show, content: {
                Hidden()
            })
    }
       
        
//.toggle() is a modifier that changes a boolean from true to false and vice versa
    
    private struct Heart: View {
        @Binding var show: Bool
        var body: some View {
            Button {
                show.toggle()
            } label: {
               Text("Reveal the Message")
            }
        }
    }
    
    //Do not worry about this function
    private struct Hidden: View {
        @State private var scale: CGFloat = 1.0
        var body: some View {
            VStack {
                Text("🩷")
                    .font(.largeTitle)
                    .scaleEffect(scale)
                    .onAppear {
                    let baseAnimation = Animation.easeInOut(duration: 1.0)
                    let repeated = baseAnimation.repeatForever(autoreverses: true)
                    withAnimation(repeated) { scale = 1.5
                                    }
                                }
                Text("Will You Be My Valentine?")
            }
        }
    }
}

//To change the view you are looking at simply just change the struct name in the #Preview

#Preview {
    Valentines()
}

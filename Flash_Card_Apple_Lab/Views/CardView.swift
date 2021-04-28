//
//  CardView.swift
//  Flash_Card_Apple_Lab
//
//  Created by Arnaud Boyer on 13/01/2021.
//

import SwiftUI

struct CardView: View {
    //var deck: Deck
    var text: String
    var text2: String
    @State var flipped = false
    @State var degree = 0.0
    var body: some View {
        Button(action: {flipped.toggle()}, label: {
            ZStack {
                VStack {
                    Text(text)
                }.frame(width: 300,height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color(red: 0.89, green: 0.61, blue: 0.31))
                .cornerRadius(18)
                .rotation3DEffect(.degrees(self.flipped ? 180 : 0),axis: (x: 0.0, y: 1.0, z: 0.0))
                .opacity(self.flipped ? 0 : 1)
                
                VStack {
                   Text(text2)
                }.frame(width: 300,height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color(red: 0.89, green: 0.61, blue: 0.31))
                .cornerRadius(18)
                .rotation3DEffect(.degrees(self.flipped ? 0 : 180),axis: (x: 0.0, y: -1.0, z: 0.0))
                .opacity(self.flipped ? 1 : 0)
            }.animation(.easeInOut(duration: 0.55))
        })
        
                          
        //        Button(action: {
        //
        //            withAnimation(.linear(duration:1.2)){
        //                self.degree += 360
        //            }
        //            withAnimation(.linear(duration:1.2)){
        //                self.flipped.toggle()
        //            }
        //        }, label: {
        //            HStack {
        //                (flipped==false ? Text(self.text.uppercased()):Text(self.text2.uppercased()))
        //                    .font(.system(size: 22))
        //                    .fontWeight(.semibold)
        //                    .foregroundColor(.black)
        //            }.frame(width: 300,height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        //            .background(Color(red: 0.89, green: 0.61, blue: 0.31))
        //            .cornerRadius(18)
        //            .rotation3DEffect(
        //                .degrees(degree),
        //                axis: (x: 0.0, y: 1.0, z: 0.0)
        //                )
        //        })
        //
    }
}
    
//    struct CardView_Previews: PreviewProvider {
//        static var previews: some View {
//            CardView(text: "Canberra", text2: "Australia")
//            
//        }
//    }

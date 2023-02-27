//
//  Homee.swift
//  Inearby
//
//  Created by Alanoud Saleh on 07/08/1444 AH.
//


import SwiftUI
import Foundation


struct Home: View {
    // MARK: View Properties
    //    @State var currentTab: Tab = .home
    @Namespace var animation
 
    @AppStorage("key7")  var shouldshowonb = true
    @State var Indecscur: Int = 0
    
    @State private var fullCoverItem: game? = nil

    
    
    var body: some View {
            VStack(spacing: 15){
                
                viewofHeader()
                
                
                
                (Text("Games")
                    .fontWeight(.semibold)
                 
                )
                .font(.title2)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.top,15)
                
                
                casutomcards(index: $Indecscur, items: Games, cardPadding: 35, id: \.id) { Games,cardSize in
                        // MARK: YOUR CUSTOM CELL VIEW
                            
                                    Image(Games.picofgame)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: cardSize.width, height: cardSize.height)
                                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                                        .onTapGesture {
                                            fullCoverItem = Games
                                        }

                        
                        
                        
                        
                    }
                
                
                
                
            }.ignoresSafeArea()
            .padding([.horizontal,.top],15)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background {
                GeometryReader{proxy in
                    let size = proxy.size
                    
                    TabView(selection: $Indecscur) {
                        ForEach(Games.indices,id: \.self){index in
                            Image(Games[index].picofgame)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: size.width, height: size.height)
                                .clipped()
                        }
                    }
                        Rectangle()
                            .fill(.ultraThinMaterial)
                        
                        
                    }
                    .ignoresSafeArea()
                }
            .fullScreenCover(item: $fullCoverItem) { item in

                if item.picofgame == "game1" {
                    ResultView(tile: "game2")
                } else if item.picofgame == "game2" {
                    ResultView(tile: "game1")


                }

                
            }

            }









    @State var presentAnotherView = false
    @ViewBuilder


    func viewofHeader()->some View{

        HStack{
            VStack(alignment: .leading, spacing: 6) {
                Text("")
                    .fontWeight(.semibold)

                .font(.title2)

            }
            .frame(maxWidth: .infinity,alignment: .leading)



            Button {
                self.presentAnotherView = true
                   } label: {
                       Image("profile")
                           .resizable()
                           .aspectRatio(contentMode: .fill)
                           .frame(width: 70, height: 70)


                   }
           //4
               }
               .sheet(isPresented: $presentAnotherView) {
                   AnotherView()
               }
        }
    }

struct AnotherView : View {

 
    var body: some View {
        Text("hey")
    }







}

struct homee_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

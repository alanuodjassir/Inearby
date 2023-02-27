//
//  ConnnectFourView.swift
//  Inearby
//
//  Created by Alanoud Saleh on 06/08/1444 AH.
//

import SwiftUI

struct ConnectFourView: View {
    @State var rpsSession: RPSMultipeerSession?
    @State var currentView: Int = 0
    @Binding var shouldshowonb : Bool
    @AppStorage("Username") var username: String = ""
    var body: some View {

        switch currentView {
        case 1:
            PairView(currentView: $currentView)
                .environmentObject(rpsSession!)
        default:
            startViewBody
        }
    }
    
    var startViewBody: some View {
        VStack {
            Spacer()
          
            Text("Inearby, Play with anonymous around you.")
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.bottom,200)
            Text("Choose a Nickname")
                .font(.callout).bold()
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .padding(.horizontal, 40)
                .multilineTextAlignment(.center)
            TextField("Nickname", text: $username)
            
                .padding([.horizontal], 75.0)
                .padding(.bottom, 24)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Continue") {
                rpsSession = RPSMultipeerSession(username: username)
                currentView = 1
            }.buttonStyle(BorderlessButtonStyle())
                .padding(.horizontal, 30)
                .padding(.vertical, 15)
                .foregroundColor(.white)
                .background(Color("BG"))
                .cornerRadius(12)
                .disabled(username.isEmpty ? true : false)
                

            Spacer()
        }.background{LinearGradient(colors: [Color("BG"),Color("BG2")], startPoint: .top, endPoint: .bottom)
            
        }.ignoresSafeArea()
            
        
    }
}

struct connnectFourView_Previews: PreviewProvider {
    static var previews: some View {
      Home()
    }
}

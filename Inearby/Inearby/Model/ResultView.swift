//
//  ResultView.swift
//  Inearby
//
//  Created by Alanoud Saleh on 07/08/1444 AH.
//

import SwiftUI



struct ResultView: View {
    var tile: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Text(tile)
                .padding()
            
                      Button("Dismiss") {
                          dismiss()
                      }
                  }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(tile: "Test")
    }
}

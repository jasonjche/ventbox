//
//  ContentView.swift
//  Shared
//
//  Created by Jason He on 3/11/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                NotesView()
                CreateView()
                    .navigationBarTitle(Text("Vents"))
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

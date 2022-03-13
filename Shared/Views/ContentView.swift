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
                HStack{
                    Spacer()
                    NavigationLink {
                        CreateView()
                    } label:{
                        Image(systemName: "square.and.pencil")
                            .font(.title)
                            .foregroundColor(Color(UIColor.systemBlue))
                            .padding(.top, 10.0)
                            .padding(.trailing, 50.0)
                    }
                    .navigationBarTitle(Text("Vents"))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

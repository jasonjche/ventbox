//  CreateView.swift
//  VentBox (iOS)
//
//  Created by Jason He on 3/12/22.
//

import SwiftUI

struct CreateView: View{
    @ObservedObject var model = ViewModel()
    
    @State var title:String = ""
    @State var notes:String = ""
    
    var body: some View{
        HStack{
            Spacer()
            NavigationLink{
                ZStack{
                    Color(UIColor.systemGray5).ignoresSafeArea()
                    VStack{
                        Section(){
                            TextField("Vent Title", text: $title)
                                .padding(.all)
                                .font(.title)
                            
                            TextEditor(text: $notes)
                                .padding(.all)
                                .cornerRadius(60)
                        }
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        Spacer()
                        
                        HStack(spacing: 20){
                            Spacer()
                            
                            Button {
                                model.addData(title: title, notes: notes)
                                title = ""
                                notes = ""
                                
                            } label: {
                                Text("Vent").bold()
                            }
                            .padding(.all)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .background(Color(UIColor.systemGreen).cornerRadius(10))
                            
                            Button {
                                title = ""
                                notes = ""
                                
                            } label: {
                                Text("Delete").bold()
                            }
                            .padding(.all)
                            .frame(maxWidth: .infinity)
                            .background(Color(UIColor.systemRed).cornerRadius(10))
                            .foregroundColor(.white)
                            
                            Spacer()
                        }
                    }
                }
            } label:{
                Image(systemName: "square.and.pencil")
                    .font(.title2)
                    .foregroundColor(Color(UIColor.systemBlue))
                    .padding(.all)
            }
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}

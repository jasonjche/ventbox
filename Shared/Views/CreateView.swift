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
    @State var isDelete:Bool = false
    @State var isNotify:Bool = false
    @State var isPost:Bool = true
    @State var deleteDate:Date = Date()
    @State var notifyDate:Date = Date()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View{
        
        ZStack{
            Color(UIColor.systemGray5).ignoresSafeArea()
            VStack{
                Form{
                    Section(header: Text("Vent")){
                        TextField("Title", text: $title)
                            .font(.largeTitle.bold())
                            .padding(.top)
                        ZStack{
                            TextEditor(text: $notes)
                            Text(notes).opacity(0).padding(.all, 8)
                        }
                    }
                    Section(header: Text("Options")){
                        Toggle(isOn: $isPost) {
                            Text("Post Anonymously?")
                        }
                        Toggle(isOn: $isDelete) {
                            Text("Delete Later")
                        }
                        if isDelete {
                            DatePicker(selection: $deleteDate, label: { Text("Delete Date") })
                        }
                        Toggle(isOn: $isNotify) {
                            Text("Notify Later")
                        }
                        if isNotify {
                            DatePicker(selection: $notifyDate, label: { Text("Notify Date") })
                        }
                    }
                    Section{
                        Button {
                            model.addData(title: title, notes: notes)
                            reset()
                        } label: {
                            Text("Vent").bold()
                        }
                        .listRowBackground(Color(UIColor.systemGreen))
                        .foregroundColor(.white)
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    Section{
                        Button {
                            reset()
                        } label: {
                            Text("Delete").bold()
                        }
                        .listRowBackground(Color(UIColor.systemRed))
                        .foregroundColor(.white)
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
            }
        }
    }
    
    func reset(){
        title = ""
        notes = ""
        isDelete = false
        isNotify = false
        isPost = true
        deleteDate = Date()
        notifyDate = Date()
        presentationMode.wrappedValue.dismiss()
    }
}


struct CustomTextEditor: View {
    let placeholder: String
    @Binding var text: String
    let internalPadding: CGFloat = 5
    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty  {
                Text(placeholder)
                    .foregroundColor(Color.primary.opacity(0.25))
                    .padding(EdgeInsets(top: 7, leading: 4, bottom: 0, trailing: 0))
                    .padding(internalPadding)
            }
            TextEditor(text: $text)
                .padding(internalPadding)
        }.onAppear() {
            UITextView.appearance().backgroundColor = .clear
        }.onDisappear() {
            UITextView.appearance().backgroundColor = nil
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}

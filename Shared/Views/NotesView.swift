//  NotesView.swift
//  VentBox
//
//  Created by Jason He on 3/12/22.
//

import SwiftUI

struct NotesView: View {
    @ObservedObject var model = ViewModel()
    
    var body: some View{
        List(model.list) {item in
            NavigationLink {
                VStack{
                    Text(item.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .padding(.all)
                    HStack {
                        Text(item.notes)
                            .font(.body)
                            .multilineTextAlignment(.leading)
                    }
                    Spacer()
                    HStack{
                        Spacer()
                        Button {
                            shareNote(title: item.title, notes: item.notes)
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                        .padding(.all)
                        .font(.title)
                        Spacer()
                        Button {
                            model.deleteData(delete: item)
                        } label: {
                            Image(systemName: "trash")
                        }
                        .padding(.all)
                        .font(.title)
                        Spacer()
                    }
                }
            } label: {
                VStack(alignment:.leading){
                    Text(item.title).font(.headline)
                    Text(item.notes).font(.subheadline).foregroundColor(Color.gray)
                }
            }
        }
    }
    
    func shareNote(title: String, notes: String){
        let shareString = title + "\n\n" + notes
        let av = UIActivityViewController(activityItems: [shareString],
                                          applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
    
    init(){
        model.getData()
    }
}

struct NotesView_Previews: PreviewProvider {
    static var previews: some View {
        NotesView()
    }
}

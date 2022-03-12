//
//  ViewModel.swift
//  VentBox
//
//  Created by Jason He on 3/11/22.
//

import Foundation
import Firebase

class ViewModel: ObservableObject {
    
    @Published var list = [Vents]()
    
    func getData(){
        let db = Firestore.firestore()
        
        db.collection("vents").getDocuments { snapshot, error in
            if error == nil{
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        self.list = snapshot.documents.map { v in
                            
                            return Vents(id: v.documentID,
                                         title: v["title"] as? String ?? "",
                                         notes: v["notes"] as? String ?? "",
                                         date: v["date"] as? String ?? "")
                        }
                    }
                }
            }
        }
    }
    
    func deleteData(delete: Vents){
        let db = Firestore.firestore()
        
        db.collection("vents").document(delete.id).delete { error in
            if error == nil {
                DispatchQueue.main.async {
                    self.list.removeAll { v in
                        return v.id == delete.id
                    }
                }
            }
        }
    }
    
    func addData(title: String, notes: String) {
        let db = Firestore.firestore()
        
        db.collection("vents").addDocument(data: ["title":title,
                                                  "notes":notes,
                                                  "date":Date()]) { error in
            if error == nil {
                self.getData()
            }
        }
    }
}

//
//  ContentView.swift
//  Bookworm
//
//  Created by PRABALJIT WALIA     on 10/11/20.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Book.entity(), sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Count: \(books.count)")
                    .navigationBarTitle("Bookworm")
                    .navigationBarItems(trailing:
                                            Button(action:{
                                                self.showingAddScreen.toggle()
                                                
                                            }){
                                                Image(systemName:"plus")
                                            })
                    .sheet(isPresented: $showingAddScreen){
                        AddBookView().environment(\.managedObjectContext, self.moc)
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

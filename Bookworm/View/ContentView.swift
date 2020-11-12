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
                List{
                    ForEach(books,id:\.self){book in
                        NavigationLink(destination:DetailView(book: book)){
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            VStack(alignment:.leading){
                                Text(book.title ?? "unknown title")
                                    .font(.headline)
                                Text(book.author ?? "unknown author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
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

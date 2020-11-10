//
//  AddBookView.swift
//  Bookworm
//
//  Created by PRABALJIT WALIA     on 10/11/20.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var title = ""
    @State private var author = ""
    @State private var genre = ""
    @State private var review = ""
    @State private var rating = 3
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Name of book", text: $title)
                    TextField("Name of author",text: $author)
                    Picker("Genre",selection: $genre){
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                    }
                }
                Section{
                    Picker("Rating",selection: $rating){
                        ForEach(0..<6){
                            Text("\($0)")
                        }
                    }
                    TextField("Write a review",text: $review)
                }
                Section{
                    Button("Save"){
                        //add the book
                    }
                }
            }
            .navigationBarTitle("Add book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}

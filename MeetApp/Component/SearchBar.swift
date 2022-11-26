//
//  SearchBar.swift
//  MeetApp
//
//  Created by Александр Лимарев on 23.11.2022.
//

import SwiftUI
import Foundation

struct SearchBar: View {
    @State var value = ""
    @State var isSearching = false
    
    var body: some View {
        HStack{
            TextField("Найти друзей", text:$value)
                .padding(.leading, 24)
        }.padding()
            .background(Color(.systemGray5))
            .cornerRadius(6.0)
            .padding(.horizontal)
            .onTapGesture(perform:  {
                isSearching = true
            })
            .overlay(
                HStack{
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    
                    Button(action: {value = ""}){
                    Image(systemName: "xmark.circle.fill")
                    }
                }.padding(.horizontal, 32)
                    .foregroundColor(.gray)
            )
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}

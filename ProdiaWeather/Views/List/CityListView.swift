//
//  CityListView.swift
//  ProdiaWeather
//
//  Created by Affandy Murad on 27/05/22.
//

import SwiftUI

struct CityListView : View {
    @EnvironmentObject var authentication: Authentication
    
    @State var isPresentingModal: Bool = false
    @State private var isEditing: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Your Cities")) {
                    ForEach(authentication.cities, id: \.name) { city in
                        CityRow(city: city)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
            }
//            .navigationBarItems(leading: EditButton(), trailing: addButton)
            .navigationBarTitle(Text("Weather"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                                    Button("Log out") {
                                        authentication.updateValidation(success: false)
                                    }
                                }
            }
        }
    }
    
    private var addButton: some View {
        Button(action: {
            self.isPresentingModal = true
        }) {
            Image(systemName: "plus.circle.fill")
            .font(.title)
        }.sheet(isPresented: $isPresentingModal) {
            NewCityView().environmentObject(self.authentication)
        }
    }
    
    private func delete(at offsets: IndexSet) {
        for index in offsets {
            authentication.cities.remove(at: index)
        }
    }

    private func move(from source: IndexSet, to destination: Int) {
        var removeCities: [City] = []
        
        for index in source {
            removeCities.append(authentication.cities[index])
            authentication.cities.remove(at: index)
        }
        
        authentication.cities.insert(contentsOf: removeCities, at: destination)
    }
    
}

//struct CityListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CityListView()
//    }
//}

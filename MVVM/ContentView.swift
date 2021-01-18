//
//  ContentView.swift
//  MVVM
//
//  Created by TAEHYUNG CHOI on 18/01/2021.
//

import SwiftUI

//Model
struct Person {
    var name: String
}

//ViewModel
class ViewModel: ObservableObject {
   @Published private var person = Person(name: "홍길동")
    
    var name: String {
        person.name
    }
    func changeName(_ name: String){
        person.name = name
    }
    func birthDay(_ day : Date) -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let birthDay = formatter.string(from: day)
        return birthDay
    }
}

//View
struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State var birthDay = Date()
    
    var body: some View {
        VStack{
            Text(viewModel.name)
            .padding()
            Text("\(viewModel.birthDay(birthDay))")
            .padding()
            
            Button(action: {
            viewModel.changeName("김태희")
            }, label: {
                Text("Change Name")
            })
            
            DatePicker("생일" , selection: $birthDay , displayedComponents : .date )
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()

        }.font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

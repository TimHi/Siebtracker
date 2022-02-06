//
//  CoffeeCupWeight.swift
//  Siebtracker
//
//  Created by Tim Hiller on 06.02.22.
//

import SwiftUI

struct CoffeeCupWeight: View {
    @ObservedObject var viewModel: CoffeeExtractionViewModel
    @State var ContinueWorkflow: Bool = false;
    var body: some View {
        HStack{
            NavigationLink(destination: RatingView(viewModel: viewModel), isActive: $ContinueWorkflow) { EmptyView() }.hidden()
            TextField("Placeholder", value: $viewModel.CurrentCoffee.settings.extractedWeight, formatter: NumberFormatter()).background(Color.gray)
        Text("Enter Weight after extraction")
        }
        Button("Drink it!"){
            self.ContinueWorkflow = true
        }
    }
}

struct CoffeeCupWeight_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeCupWeight(viewModel: CoffeeExtractionViewModel(currentCoffee: CoffeeDataModel(coffeeId: UUID(), date: Date())))
    }
}

//
//  CoffeeRatioView.swift
//  Siebtracker
//
//  Created by Tim Hiller on 06.02.22.
//

import SwiftUI

struct CoffeeRatioView: View {
    @ObservedObject var viewModel: CoffeeExtractionViewModel
    @State var ContinueWorkflow = false
    var body: some View {
        VStack{
            Image("grindedCoffee").resizable().aspectRatio(contentMode: .fit)
            NavigationLink(destination: CoffeeCupWeight(viewModel: viewModel), isActive: $ContinueWorkflow) { EmptyView() }.hidden()
        Text("Choose your ratio")
            HStack{
                TextField("Placeholder", value: $viewModel.CurrentCoffee.settings.espressoRatio, formatter: NumberFormatter()).background(Color.gray)
                Text("G Espresso equals ")
                TextField("Placeholder", value: $viewModel.CurrentCoffee.settings.waterRatio, formatter: NumberFormatter()).background(Color.gray)
                Text("G of Water")
            }
            Button("Continue"){
                self.ContinueWorkflow = true
            }
        }
    }
}

struct CoffeeRatioView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeRatioView(viewModel: CoffeeExtractionViewModel(currentCoffee: CoffeeDataModel(coffeeId: UUID(), date: Date())))
    }
}

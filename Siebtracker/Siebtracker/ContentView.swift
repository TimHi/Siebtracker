//
//  ContentView.swift
//  Siebtracker
//
//  Created by Tim Hiller on 06.02.22.
//

import SwiftUI
import Resolver

struct ContentView: View {
    @State var IsCoffeeWorkflow: Bool = false
    private var viewModel : ContentViewModel = ContentViewModel()
    private var extractionViewModel : CoffeeExtractionViewModel = CoffeeExtractionViewModel(currentCoffee: CoffeeDataModel(coffeeId: UUID(), date: Date()))
    var body: some View {
        NavigationView{
        VStack{
            NavigationLink(destination: CoarseGrindView(viewModel: extractionViewModel), isActive: $IsCoffeeWorkflow) { EmptyView() }.hidden()
            Button("Start making a coffee"){
                //TODO: This can't be good
                viewModel.updateCoffee()
                extractionViewModel.CurrentCoffee = viewModel.currentCoffee
                self.IsCoffeeWorkflow = true
            }
            ExtractedCoffeeView(extractedCoffee: getLastCoffee())
        }
        }
    }
    func getLastCoffee() -> CoffeeDataModel{
        return viewModel.getLastCoffee()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

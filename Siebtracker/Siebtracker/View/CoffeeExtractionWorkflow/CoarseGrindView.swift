//
//  CoarseGrindView.swift
//  Siebtracker
//
//  Created by Tim Hiller on 06.02.22.
//

import SwiftUI
import Resolver

struct CoarseGrindView: View {
    
    @ObservedObject var viewModel: CoffeeExtractionViewModel
    @State var ContinueWorkflow : Bool = false
    var body: some View {
        VStack{
            Image("siebträger").resizable().aspectRatio(contentMode: .fit)
            HStack{
                TextField("Placeholder", value: $viewModel.CurrentCoffee.settings.coarseGrindWeight, formatter: NumberFormatter()).background(Color.gray)
                Text("Gramm of Coffee")
            }
            
            NavigationLink(destination: CoffeeRatioView(viewModel: viewModel), isActive: $ContinueWorkflow) { EmptyView() }.hidden()
            Button("Set ratio") { 
                self.ContinueWorkflow = true
            }
        }
    }
}
struct CoarseGrindView_Previews: PreviewProvider {
    static var previews: some View {
        CoarseGrindView(viewModel: CoffeeExtractionViewModel(currentCoffee: CoffeeDataModel(coffeeId: UUID(), date: Date())))
    }
}

//
//  RatingView.swift
//  Siebtracker
//
//  Created by Tim Hiller on 06.02.22.
//

import SwiftUI

struct RatingView: View {
    @ObservedObject var viewModel: CoffeeExtractionViewModel
    @State var ContinueWorkflow : Bool = false
    @State var bitterNess : Int = 0 //TODO: Figure out how to bind to currentcoffee
    @State var sourNess : Int = 0
    @State var overallTaste : Int = 0
    var body: some View {
        VStack{
        NavigationLink(destination: ContentView(), isActive: $ContinueWorkflow) { EmptyView() }.hidden()
        Text("Rate your Coffee")
        Text("Bitterness")
        StarRatingView(rating: $bitterNess)
        Text("Sourness")
        StarRatingView(rating: $sourNess)
        Text("Overall Taste")
        StarRatingView(rating: $overallTaste)
        
        Button("Store Coffee"){
            viewModel.CurrentCoffee.rating.bitterness = bitterNess
            viewModel.CurrentCoffee.rating.sourness = sourNess
            viewModel.CurrentCoffee.rating.taste = overallTaste
            viewModel.StoreCoffeeSettings()
            self.ContinueWorkflow = true
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(viewModel: CoffeeExtractionViewModel(currentCoffee: CoffeeDataModel(coffeeId: UUID(), date: Date())))
    }
}

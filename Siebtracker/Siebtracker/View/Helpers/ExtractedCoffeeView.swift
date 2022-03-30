//
//  ExtractedCoffeeView.swift
//  Siebtracker
//
//  Created by Tim Hiller on 06.02.22.
//

import SwiftUI

struct ExtractedCoffeeView: View {
    @State var extractedCoffee : CoffeeDataModel
    var body: some View {
        VStack{
            HStack{
                Text("Used Coffee: ")
                Text("\(extractedCoffee.settings.coarseGrindWeight)g")
            }
            HStack{
                Text("Ratio: ")
                Text("Espresso:  \(extractedCoffee.settings.espressoRatio)g to \(extractedCoffee.settings.waterRatio)g")
            }
            HStack{
                Text("Extraction time: ")
                Text("\(extractedCoffee.settings.extractionTime) seconds")
            }
            HStack{
                Text("Extracted weight: ")
                Text("\(extractedCoffee.settings.extractedWeight)g")
            }
            HStack{
                Text("Bitterness: ")
                StarRatingView(rating: $extractedCoffee.rating.bitterness)
            }
            HStack{
                Text("Sourness: ")
                StarRatingView(rating: $extractedCoffee.rating.sourness)
            }
            HStack{
                Text("Taste: ")
                StarRatingView(rating: $extractedCoffee.rating.taste)
            }
        }
    }
}
struct ExtractedCoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        ExtractedCoffeeView(extractedCoffee: CoffeeDataModel(coffeeId: UUID(), date: Date()))
    }
}

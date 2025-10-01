//
//  ListRecipeViewModel.swift
//  RecipesHW
//
//  Created by Глеб Моргунов on 29.09.25.

import Foundation
import Combine

final class ListRecipeViewModel: ObservableObject {
	@Published var presentSheet: Bool = false
	@Published var selectedRecipe: Recipes?
	@Published var recipes: [Recipes] = [ .init(name:"Карбонара",description: "Паста в сливочном соусе",dishesCount: 1, selectedTime: 1 ),]
	
	func openSheet() {
		presentSheet = true
	}
}

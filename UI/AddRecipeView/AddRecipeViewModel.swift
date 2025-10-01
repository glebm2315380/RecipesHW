//
//  AddRecipeViewModel.swift
//  RecipesHW
//
//  Created by Глеб Моргунов on 30.09.25.
//

import Foundation
import Combine

final class AddRecipeViewModel: ObservableObject{
	@Published var recipeName: String
	@Published var recipeDescription: String
	@Published var dishesCount: String
	@Published var selectedTime: Int
	@Published var isEditing: Bool = false
	
	init(recipeName: String = "", recipeDescription: String = "", dishesCount: String = "0", selectedTime: Int = 0) {
		self.recipeName = recipeName
		self.recipeDescription = recipeDescription
		self.dishesCount = dishesCount
		self.selectedTime = selectedTime
	}
}

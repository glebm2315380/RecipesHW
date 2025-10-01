import Foundation
import Combine

final class RecipeEditViewModel: ObservableObject {
	@Published var recipeName: String
	@Published var recipeDescription: String
	@Published var dishesCount: Int
	@Published var selectedTime: Int
	
	init(recipeName: String = "", recipeDescription: String = "", dishesCount: Int = 1, selectedTime: Int = 0) {
			self.recipeName = recipeName
			self.recipeDescription = recipeDescription
			self.dishesCount = dishesCount
			self.selectedTime = selectedTime
		}
	
	var timeText: String {
		switch selectedTime {
		case 0: return "30 мин"
		case 1: return "1 час"
		case 2: return "2 часа"
		default: return "-"
		}
	}
}

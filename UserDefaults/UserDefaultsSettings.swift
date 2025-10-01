
import Foundation

final class UserDefaultsSettings {
	
	static let shared = UserDefaultsSettings()
	
	func getRecipe() -> Recipes {
		let decoder = PropertyListDecoder()
		
		if let data = UserDefaults.standard.value(forKey: "Recipe") as? Data {
			let recipe = try? decoder.decode(Recipes.self, from: data)
			return recipe ??  .init(name:"no info",description: "no info",dishesCount: 0, selectedTime: 5 )
		}
		return .init(name:"no info",description: "no info",dishesCount: 0, selectedTime: 5 )
	}
	
	func setRecipe(new recipe: Recipes) {
		let encoder = PropertyListEncoder()
		UserDefaults.standard.set(try? encoder.encode(recipe), forKey: "Recipe")
	}
}

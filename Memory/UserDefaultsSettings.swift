//
//  UserDefaults.swift
//  RecipesHW
//
//  Created by Глеб Моргунов on 30.09.25.
//

import Foundation

final class UserDefaultsSettings {
	
	static let shared = UserDefaultManager()
	
	func getRecipe() -> Recipes {
		let decoder = PropertyListDecoder()
		
		if let data = UserDefaults.standard.value(forKey: "Recipe") as? Data {
			let recipe = try? decoder.decode(Recipes.self, from: data)
			return recipe ?? .init(name: "No recipe")
		}
		return .init(name: "No recipe")
	}
	
	func setRecipe(new recipe: Recipes) {
		let encoder = PropertyListEncoder()
		UserDefaults.standard.set(try? encoder.encode(recipe), forKey: "Recipe")
	}
}

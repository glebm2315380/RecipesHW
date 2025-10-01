//
//  Recipes.swift
//  RecipesHW
//
//  Created by Глеб Моргунов on 30.09.25.
//

import Foundation

struct Recipes: Codable, Identifiable, Hashable {
	var id = UUID()
	let name: String
	let description: String
	let dishesCount: Int
	let selectedTime: Int
}

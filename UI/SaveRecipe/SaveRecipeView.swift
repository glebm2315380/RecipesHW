//
//  RecipeDetailView.swift
//  RecipesHW
//
//  Created by Захар Литвинчук on 28.09.2025.
//

import SwiftUI

struct SaveRecipeView: View {
	
	@StateObject var viewModel = SaveRecipeViewModel()
	
	var body: some View {
		List {
			nameSection
			descriptionSection
			cooktimeSection
			dishesCountSection
		}
		.navigationTitle("Рецепт")
		saveButtonContainer
	}
	
	private var nameSection: some View {
		Section("Название") {
			HStack {
				Image(systemName: "fork.knife")
					.foregroundColor(.blue)
				TextField("Новое название", text: $viewModel.recipeName)
			}
		}
	}
	
	private var descriptionSection: some View {
		Section("Описание") {
			HStack(alignment: .top) {
				Image(systemName: "text.alignleft")
					.foregroundColor(.green)
				TextField("Новое oписание", text: $viewModel.recipeDescription)
			}
		}
	}
	
	private var cooktimeSection: some View {
		Section("Время приготовления") {
			HStack {
				Image(systemName: "clock")
					.foregroundColor(.orange)
				Text(viewModel.timeText)

			}
		}
	}
	
	private var dishesCountSection: some View {
		Section("Количество порций") {
			HStack {
				Image(systemName: "person.2.fill")
					.foregroundColor(.purple)
				TextField("Введите количество порций",text: $viewModel.dishesCount)
			}
		}
	}
	
	private var saveButtonContainer: some View {
		Button {
			viewModel.newRecipeData()
		} label: {
			Text("Сохранить")
				.frame(maxWidth: .infinity)
				.padding(.vertical, 10)
		}
		.padding(10)
		.buttonStyle(.borderedProminent)
		
	}
	
}

#Preview {
	NavigationStack {
		SaveRecipeView()
	}
}

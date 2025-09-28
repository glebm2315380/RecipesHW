//
//  RecipeDetailView.swift
//  RecipesHW
//
//  Created by Захар Литвинчук on 28.09.2025.
//

import SwiftUI

struct RecipeDetailView: View {
	
	// TODO: - Создать viewModel и вынести все свойства отслеживаемые внутрь viewModel.
	// TODO: - Положить информацию о рецепте в локальное хранилище
	// TODO: - Обновлять информацию в локальном хранилище при изменении
	
	@State private var recipeName: String = "Паста Карбонара"
	@State private var recipeDescription: String = "Классический итальянский рецепт с беконом, сливками и сыром пармезан."
	@State private var dishesCount: Int = 2
	@State private var selectedTime: Int = 1
	@State private var isEditing: Bool = false
	
	var body: some View {
		List {
			nameSection
			descriptionSection
			cooktimeSection
			dishesCountSection
		}
		.navigationTitle("Рецепт")
		.toolbar {
			ToolbarItem(placement: .topBarTrailing) {
				Button {
					isEditing.toggle()
				} label: {
					Image(systemName: "pencil")
				}
			}
		}
		.sheet(isPresented: $isEditing) {
			NavigationStack {
				RecipeEdit()
			}
		}
	}
	
	private var nameSection: some View {
		Section("Название") {
			HStack {
				Image(systemName: "fork.knife")
					.foregroundColor(.blue)
				Text(recipeName)
			}
		}
	}
	
	private var descriptionSection: some View {
		Section("Описание") {
			HStack(alignment: .top) {
				Image(systemName: "text.alignleft")
					.foregroundColor(.green)
				Text(recipeDescription)
			}
		}
	}
	
	private var cooktimeSection: some View {
		Section("Время приготовления") {
			HStack {
				Image(systemName: "clock")
					.foregroundColor(.orange)
				Text(timeText)
			}
		}
	}
	
	private var dishesCountSection: some View {
		Section("Количество порций") {
			HStack {
				Image(systemName: "person.2.fill")
					.foregroundColor(.purple)
				Text("\(dishesCount)")
			}
		}
	}
	
	private var timeText: String {
		switch selectedTime {
		case 0: return "30 мин"
		case 1: return "1 час"
		case 2: return "2 часа"
		default: return "-"
		}
	}
}

#Preview {
	NavigationStack {
		RecipeDetailView()
	}
}

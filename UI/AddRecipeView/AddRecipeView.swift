//
//  RecipeDetailView.swift
//  RecipesHW
//
//  Created by Захар Литвинчук on 28.09.2025.
//

import SwiftUI

struct AddRecipeView: View {
	
	// TODO: - Создать viewModel и вынести все свойства отслеживаемые внутрь viewModel.
	// TODO: - Положить информацию о рецепте в локальное хранилище
	// TODO: - Обновлять информацию в локальном хранилище при изменении
	@StateObject private var viewModel = AddRecipeViewModel()
	@State private var isEditing: Bool = false
	
	var body: some View {
		List {
			nameSection
			descriptionSection
			cooktimeSection
			dishesCountSection
		}
		.navigationTitle("Новый рецепт")
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
				RecipeEditView()
			}
		}
	}
	
	private var nameSection: some View {
		Section("Название") {
			HStack {
				Image(systemName: "fork.knife")
					.foregroundColor(.blue)
				TextField("Введите название",text: $viewModel.recipeName)
			}
		}
	}
	
	private var descriptionSection: some View {
		Section("Описание") {
			HStack(alignment: .top) {
				Image(systemName: "text.alignleft")
					.foregroundColor(.green)
				TextField("Введите описание", text: $viewModel.recipeDescription)
			}
		}
	}
	
	private var cooktimeSection: some View {
		Section("Время приготовления") {
			HStack {
				Image(systemName: "clock")
					.foregroundColor(.orange)
				Picker("Выберите время", selection: $viewModel.selectedTime) {
					Text("30 мин")
					 .tag(0)
				 Text("1 час")
					 .tag(1)
				 Text("2 часа")
					 .tag(2)
			 }
			}
		}
	}
	
	private var dishesCountSection: some View {
		Section("Количество порций") {
			HStack {
				Image(systemName: "person.2.fill")
					.foregroundColor(.purple)
				TextField("Введите кол-во гостей", text: $viewModel.dishesCount)
			}
		}
	}
	
	}

#Preview {
	NavigationStack {
		RecipeDetailView()
	}
}

//
//  RecipeEdit.swift
//  RecipesHW
//
//  Created by Захар Литвинчук on 28.09.2025.
//


import SwiftUI

struct RecipeEditView: View {

	// TODO: - Создать viewModel и вынести все свойства отслеживаемые внутрь viewModel.
	@StateObject private var viewModel = RecipeEditViewModel()
	
	var body: some View {
		VStack(alignment: .leading, spacing: 24) {
			recipeNameSection
			recipeDescriptionSection
			remainingTimeSection
			dishesCountSection
			Spacer()
			saveButtonSection
		}
		.padding(16)
		.navigationTitle("Редактирование рецепта")
		.navigationBarTitleDisplayMode(.inline)
		.presentationDragIndicator(.visible)
	}

	private var recipeNameSection: some View {
		VStack(alignment: .leading, spacing: 16) {
			Text("Название рецепта")
				.font(.headline)

			TextField("Новое название", text: $viewModel.recipeName)
				.textFieldStyle(.roundedBorder)
		}
	}

	private var recipeDescriptionSection: some View {
		VStack(alignment: .leading, spacing: 16) {
			Text("Описание рецепта")
				.font(.headline)
			
			TextField("Введите описание...", text: $viewModel.recipeDescription, axis: .vertical)
				.lineLimit(5, reservesSpace: true)
				.textFieldStyle(.roundedBorder)
		}
	}

	private var remainingTimeSection: some View {
		VStack(alignment: .leading, spacing: 16) {
			Text("Время приготовления")
				.font(.headline)

			Picker("Время приготовления", selection: $viewModel.selectedTime) {
				Text("30 мин")
					.tag(0)
				Text("1 час")
					.tag(1)
				Text("2 часа")
					.tag(2)
			}
		}
		.pickerStyle(.segmented)
	}
	
	private var dishesCountSection: some View {
		HStack(spacing: 16) {
			Text("Количество порции")
				.font(.headline)

			Spacer()

			Stepper(value: $viewModel.dishesCount, in: 1...20) {
				Text("\(viewModel.dishesCount)")
					.frame(width: 30)
			}
		}
	}
	
	private var saveButtonSection: some View {
		Button {
			// TODO: Действие для сохранение в локальное хранилище информации о рецепте
		} label: {
			Text("Сохранить")
				.frame(maxWidth: .infinity)
				.padding(.vertical, 6)
		}
		.buttonStyle(.borderedProminent)
	}
}

#Preview {
	NavigationStack {
		RecipeEditView()
	}
}

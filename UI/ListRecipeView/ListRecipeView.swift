import SwiftUI


struct ListRecipeView: View {
	
	@StateObject private var viewModel = ListRecipeViewModel()
	
	var body: some View {
		NavigationStack{
			VStack(spacing: 15) {
				List {
					Section {
						ForEach(viewModel.recipes) {recipe in
							recipesSections(recipe: recipe)
						}
					}
				}
				.navigationDestination(item: $viewModel.selectedRecipe) { recipe in
					RecipeEditView()
				}
				.navigationTitle("Рецепты")
				.toolbar {
					ToolbarItem(placement: .topBarTrailing) {
						Button {
							viewModel.openSheet()
						} label: {
							Image(systemName: "plus.circle.fill")
						}
					}
				}
				.sheet(isPresented: $viewModel.presentSheet) {
					NavigationStack {
						SaveRecipeView()
					}
				}
			}
		}
		
		
	}
	
	func recipesSections(recipe: Recipes) -> some View {
		Button {
			viewModel.selectedRecipe = recipe
		} label: {
			HStack {
				Text(recipe.name)
				
				Spacer()
				
				Image(systemName: "chevron.right")
			}
			.fontWeight(.semibold)

		}
		.buttonStyle(.plain)
	}
	
}

#Preview {
	ListRecipeView()
}

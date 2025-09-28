//
//  ContentView.swift
//  RecipesHW
//
//  Created by Захар Литвинчук on 28.09.2025.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		TabView {
			NavigationStack {
				RecipeDetailView()
			}
			.tag(0)
			.tabItem {
				Image(systemName: "fork.knife.circle.fill")
				Text("Рецепт")
			}
		}
	}
}

#Preview {
	ContentView()
}

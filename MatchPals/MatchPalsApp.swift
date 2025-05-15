import SwiftUI
import Clerk

@main
struct ClerkQuickstartApp: App {
	 @State private var clerk = Clerk.shared

	 var body: some Scene {
			WindowGroup {
				 ZStack {
						if clerk.isLoaded {
							 ContentView()
									.preferredColorScheme(.light)
						} else {
							 ProgressView()
						}
				 }
				 .environment(clerk)
				 .task {
						clerk.configure(publishableKey: "pk_test_Ym9zcy1naXJhZmZlLTYwLmNsZXJrLmFjY291bnRzLmRldiQ")
						try? await clerk.load()
				 }
			}
	 }
}

import SwiftUI
import Clerk

struct ContentView: View {
	 @Environment(Clerk.self) private var clerk

	 var body: some View {
			VStack {
				 if let user = clerk.user {
						tab_view()
//						Text("Hello, \(user.id)")
//						Button("Sign Out") {
//							 Task { try? await clerk.signOut() }
//						}
				 } else {
						SignUpOrSignInView()
				 }
			}
			.animation(.easeInOut(duration: 0.3), value: clerk.user)
	 }
}

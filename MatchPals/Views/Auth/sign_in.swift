import SwiftUI
import Clerk

struct SignInView: View {
	 @State private var email = ""
	 @State private var password = ""

	 var body: some View {
			VStack(spacing: 20) {
				 Text("Sign In")
						.font(.largeTitle)
						.bold()
						.padding(.bottom, 10)

				 VStack(spacing: 16) {
						TextField("Email", text: $email)
							 .textInputAutocapitalization(.never)
							 .keyboardType(.emailAddress)
							 .autocorrectionDisabled(true)
							 .padding()
							 .background(Color(.secondarySystemBackground))
							 .cornerRadius(8)

						SecureField("Password", text: $password)
							 .padding()
							 .background(Color(.secondarySystemBackground))
							 .cornerRadius(8)
				 }

				 Button(action: {
						Task { await submit(email: email, password: password) }
				 }) {
						Text("Continue")
							 .frame(maxWidth: .infinity)
							 .padding()
							 .background(Color.accentColor)
							 .foregroundColor(.white)
							 .cornerRadius(8)
				 }
			}
			.padding()
	 }
}

extension SignInView {
	 func submit(email: String, password: String) async {
			do {
				 try await SignIn.create(
						strategy: .identifier(email, password: password)
				 )
			} catch {
				 dump(error)
			}
	 }
}

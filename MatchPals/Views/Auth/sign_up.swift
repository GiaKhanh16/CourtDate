import SwiftUI
import Clerk

struct SignUpView: View {
	 @State private var email = ""
	 @State private var password = ""
	 @State private var code = ""
	 @State private var isVerifying = false

	 var body: some View {
			VStack(spacing: 20) {
				 Text("Sign Up")
						.font(.largeTitle)
						.bold()
						.padding(.bottom, 10)

				 if isVerifying {
						TextField("Code", text: $code)
							 .textInputAutocapitalization(.never)
							 .keyboardType(.emailAddress)
							 .autocorrectionDisabled(true)
							 .padding()
							 .background(Color(.secondarySystemBackground))
							 .cornerRadius(8)


						Button("Verify") {
							 Task { await verify(code: code) }
						}
						.buttonStyle(.borderedProminent)
				 } else {
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
						
						Button("Continue") {
							 Task { await signUp(email: email, password: password) }
							 
						}
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

extension SignUpView {
	 func signUp(email: String, password: String) async {
			do {
				 let signUp = try await SignUp.create(
						strategy: .standard(emailAddress: email, password: password)
				 )

				 try await signUp.prepareVerification(strategy: .emailCode)

				 isVerifying = true
			} catch {
				 dump(error)
			}
	 }

	 func verify(code: String) async {
			do {
				 guard let signUp = Clerk.shared.client?.signUp else {
						isVerifying = false
						return
				 }

				 try await signUp.attemptVerification(strategy: .emailCode(code: code))
			} catch {
				 dump(error)
			}
	 }
}

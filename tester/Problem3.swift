import SwiftUI


struct Contact: Identifiable {
    let id = UUID()
    var name: String
    var phoneNumber: String
    var isFavorite: Bool
}

struct ContactRow: View {
    var contact: Contact
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(contact.name)
                    .font(.headline)
                Text(contact.phoneNumber)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            if contact.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .padding()
    }
}

struct FriendView: View {
    @State private var contacts = [
        Contact(name: "John Doe", phoneNumber: "123-456-7890", isFavorite: true),
        Contact(name: "Jane Smith", phoneNumber: "987-654-3210", isFavorite: false),
        Contact(name: "Alice Johnson", phoneNumber: "555-123-4567", isFavorite: true)
    ]
    
    @State private var isAddingContact = false
    @State private var newContactName = ""
    @State private var newContactPhoneNumber = ""
    @State private var newContactIsFavorite = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(contacts) { contact in
                    ContactRow(contact: contact)
                }
                
                Button(action: {
                    isAddingContact = true
                }, label: {
                    Label("Add Contact", systemImage: "plus")
                })
            }
            .navigationTitle("Contacts")
            .sheet(isPresented: $isAddingContact) {
                AddContactView(
                    isPresented: $isAddingContact,
                    name: $newContactName,
                    phoneNumber: $newContactPhoneNumber,
                    isFavorite: $newContactIsFavorite,
                    onSave: addContact
                )
            }
        }
    }
    
    private func addContact() {
        
        let newContact = Contact(
            name: newContactName,
            phoneNumber: newContactPhoneNumber,
            isFavorite: newContactIsFavorite
        )
        contacts.append(newContact)
        
        newContactName = ""
        newContactPhoneNumber = ""
        newContactIsFavorite = false
    }
}

struct AddContactView: View {
    @Binding var isPresented: Bool
    @Binding var name: String
    @Binding var phoneNumber: String
    @Binding var isFavorite: Bool
    
    var onSave: () -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Contact Details")) {
                    TextField("Name", text: $name)
                    TextField("Phone Number", text: $phoneNumber)
                    Toggle("Favorite", isOn: $isFavorite)
                }
            }
            .navigationTitle("Add Contact")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        onSave()
                        isPresented = false
                    }
                    .disabled(name.isEmpty || phoneNumber.isEmpty) // Disable save if fields are empty
                }
            }
        }
    }
}

#Preview {
    FriendView()
}

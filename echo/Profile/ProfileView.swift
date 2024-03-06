import SwiftUI
import MapKit

struct CustomeButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 70)
            .padding(.vertical, 10)
            .background(Color("ColorPrincipal"))
            .foregroundColor(.white)
            .font(.system(size: 18, weight: .bold))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("ColorPrincipal"))
            )
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct ProfileView: View {
    @State private var myPlace: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 19.04802, longitude: -98.29617) // Default value
    @State private var currentTab: Int = ProfileTabs.statistics.rawValue
    @State private var showMenu = false // For showing the action sheet
    @State private var navigateToSettings = false // To control navigation to the settings view
    @State private var navigateToLogIn = false // To control navigation to the login view
    
    var body: some View {
        ZStack {
            Color("BackgroundColor") 
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    // Top right menu button with action sheet
                    HStack {
                        Spacer()
                        Button(action: {
                            self.showMenu = true
                        }) {
                            Image(systemName: "ellipsis")
                                .imageScale(.large)
                                .rotationEffect(Angle(degrees: 90))
                                .foregroundColor(.blue) // Use your principal color here
                        }
                        .actionSheet(isPresented: $showMenu) {
                            ActionSheet(title: Text("Opciones"), buttons: [
                                .default(Text("Configuraciones")) {
                                    self.navigateToSettings = true
                                },
                                .default(Text("Cerrar sesión")) {
                                    self.navigateToLogIn = true
                                },
                                .cancel()
                            ])
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 30)
                    
                    // Profile picture
                    Circle()
                        .strokeBorder(Color.gray, lineWidth: 4) // Adds a border to the profile picture
                        .background(Circle().foregroundColor(.white))
                        .frame(width: 100, height: 100)
                        .shadow(radius: 10) // Adds a shadow for depth
                        .padding(.top, 50)
                   
                    // Profile Information and Follow/Message Buttons
                    VStack(alignment: .center) {
                        Image("profile_pic") // Replace "profile_pic" with your actual image asset name
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        
                        Text("@Catherine12") // Replace with actual username
                            .font(.title)
                        Text("My name is Catherine. I like dancing in the rain and travelling all around the world.")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                    
                        NavigationLink(destination: MyPlaceView(myPlace: $myPlace)) {
                            HStack {
                                Image(systemName: "house")
                                Text("Mi casa")
                            }
                            
                            EmptyView()
                                
                            
                        }
                        .padding(.bottom)
                        .buttonStyle(CustomeButtonStyle())
                        .shadow(color: .gray, radius: 5, x: 0, y: 2)
                        .foregroundColor(Color("ColorPrincipal"))
                    }
                    
                    Divider()
                    
                    // Custom Tab Bar View
                    ProfileTabBarView(currentTab: $currentTab)
                        .frame(maxWidth: .infinity)
                        .frame(alignment: .center)
                        .padding()
                    
                    // Content for selected tab
                    Group {
                        switch currentTab {
                        case ProfileTabs.statistics.rawValue:
                            Text("Mis publicaciones content goes here") // Replace with actual content view
                        case ProfileTabs.badges.rawValue:
                            Text("Mis votos content goes here") // Replace with actual content view
                        default:
                            EmptyView()
                        }
                    }
                    .animation(.easeInOut, value: currentTab)
                    .transition(.slide)
                    
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
        .background(
            NavigationLink(destination: SettingsView(), isActive: $navigateToSettings) {
                        EmptyView()
            }
        )
        .background(
            NavigationLink(destination: LoginView(), isActive: $navigateToLogIn) {
                        EmptyView()
            }
        )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

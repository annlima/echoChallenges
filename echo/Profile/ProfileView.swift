import SwiftUI
import MapKit

struct ProfileView: View {
    
    let profile: Profile = .test
    @State var text: String = ""
    @State private var isSelectedPosts = true
    @State private var isSelectedComplaint = false
    @State private var alertText = ""
    @State private var showingBadge = false
    
    @State private var myPlace: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 19.04802, longitude: -98.29617) // Default value
    @State private var currentTab: Int = ProfileTabs.statistics.rawValue
    @State private var showMenu = false // For showing the action sheet
    @State private var navigateToSettings = false // To control navigation to the settings view
    @State private var navigateToLogIn = false // To control navigation to the login view
    @State private var badgeEarned = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack(alignment: .topTrailing) {
                    
                    profile.backgroundPhoto
                        .resizable()
                        .frame(height: 170)
                        .ignoresSafeArea()
                    
                    
                    Menu {
                        Button {
                            self.navigateToSettings = true
                        } label: {
                            Text("Configuración")
                        }
                        
                        Button{
                            self.navigateToLogIn = true
                        } label: {
                            Text("Cerrar sesión")
                            
                        }
                    } label: {
                        Image(systemName: "ellipsis")
                            .imageScale(.large)
                            .rotationEffect(Angle(degrees: 90))
                            .foregroundColor(.colorPrincipal) // Use your principal color here
                    }
                    .frame(width: 40, height: 40)
                    .background{
                        Color.white
                            .opacity(0.7)
                    }
                    .cornerRadius(30)
                    .shadow(radius: 10)
                    .padding(.top, 50)
                    .padding(.trailing, 15)
                    
                    VStack (alignment: .center, spacing: 10) {
                        
                        // Profile picture
                        profile.profilePhoto
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                            .clipShape(.circle)
                            .padding(4)
                            .background {
                                Circle()
                                    .strokeBorder(Color.gray, lineWidth: 4) // Adds a border to the profile picture
                                    .background(Circle().foregroundColor(.white))
                                    .frame(width: 100, height: 100)
                                    .shadow(radius: 10) // Adds a shadow for depth
                                    .padding(.top, 50)
                            }
                            .padding(.top, 70)
                        
                        // Profile Information and Follow/Message Buttons
                        Text(profile.name) // Replace with actual username
                            .font(.title)
                            .bold()
                        
                        Text(profile.headline)
                            .multilineTextAlignment(.center)
                        
                        Text(profile.location)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
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
                        
                        
                        
                        VStack(alignment: .leading, spacing: 20) {
                            
                            Divider()
                            
                            Text("Mis Insignias")
                                .font(.system(.title2, weight: .bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ScrollView(.horizontal) {
                                HStack(spacing: 8) {
                                    
                                    ForEach(0 ..< profile.badges.count, id: \.self) { value in
                                        
                                        getBadge(type: value, width: 60)
                                            .frame(width: 60, height: 60)
                                            .shadow(color: .gray, radius: 1, x: 0, y: 2)
                                            .alert(self.text, isPresented: $showingBadge) {
                                                Button("OK", role: .cancel) { }
                                                
                                            }
                                            .onTapGesture(perform: {
                                                self.text = getTypeBadge(type: value)
                                                self.showingBadge.toggle()
                                            })
                                        
                                    }
                                }
                            }
                            
                            Divider()
                            
                            
                            Text("Mis Contribuciones")
                                .font(.system(.title2, weight: .bold))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            ForEach(profile.complaints ?? [Complaint.none]) { complaint in
                                
                                VStack {
                                    ComplaintsLeaderView(complaint: complaint)
                                    Divider()
                                }
                                
                            }
                        }
                        
                        Spacer()
                        
                        Button {
                            withAnimation {
                                self.badgeEarned.toggle()
                                
                                    
                            }
                        } label: {
                            Text("Test")
                        }
                    }
                    .padding()
                }
            }
            .ignoresSafeArea()
            .navigationDestination(isPresented: $navigateToSettings) {
                SettingsView()
            }
            .navigationDestination(isPresented: $navigateToLogIn) {
                LoginView()
            }
            .overlay(
                badgeEarned ? BadgeEarnedView(): nil
            )
        }
        .navigationBarHidden(true)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

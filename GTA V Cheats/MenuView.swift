//
//  MenuView.swift
//  GTA V Cheats
//
//  Created by Ashwin Ravikumar on 25/07/20.
//

import SwiftUI

struct MenuView: View {
    @EnvironmentObject var pins: Pins
    let xbox: [Cheatcode] = Bundle.main.decode("xboxcheatcodes.json")
    let playstation: [Cheatcode] = Bundle.main.decode("playstationcheatcodes.json")
    let pc: [Cheatcode] = Bundle.main.decode("pccheatcodes.json")
    @State private var device: Int? = 0
    @Environment(\.verticalSizeClass) var sizeClass
    @State private var showingIntro = !UserDefaults.standard.bool(forKey: "LaunchedBefore")
    @Environment(\.colorScheme) var colorScheme
    @State private var showingInformation = false
    @State private var showSheet = true
    
    var body: some View {
        NavigationView {
            ZStack {
                if colorScheme == .dark {
                    LinearGradient(Color.darkStart, Color.darkEnd)
                } else {
                    Color.offWhite
                }

                NavigationLink(destination: ContentView(cheatcodes: pc, device: "Computer"), tag: 1, selection: $device) {
                    EmptyView()
                }
                
                NavigationLink(destination: ContentView(cheatcodes: xbox, device: "Xbox"), tag: 2, selection: $device) {
                    EmptyView()
                }
                
                NavigationLink(destination: ContentView(cheatcodes: playstation, device: "Playstation"), tag: 3, selection: $device) {
                    EmptyView()
                }
                
                HStack (spacing: 30) {
                    if sizeClass == .compact {
                        Button(action: {
                            self.device = 1
                        }) {
                            Text("Computer")
                                .font(.title)
                                .fontWeight(.thin)
                                //.foregroundColor(.black)
                        }.buttonStyle(DarkorLightButtonStyle())
                        
                        Button(action: {
                            self.device = 2
                        }) {
                            Text("Xbox")
                                .font(.title)
                                .fontWeight(.thin)
                                //.foregroundColor(.black)
                        }.buttonStyle(DarkorLightButtonStyle())
                        
                        Button(action: {
                            self.device = 3
                        }) {
                            Text("Playstation")
                                .font(.title)
                                .fontWeight(.thin)
                                //.foregroundColor(.black)
                        }.buttonStyle(DarkorLightButtonStyle())
                    } else {
                        VStack (spacing: 50) {
                            //Vertical mode on the iPhone
                            Button(action: {
                                self.device = 1
                            }) {
                                Text("Computer")
                                    .font(.title)
                                    .fontWeight(.thin)
                                    //.foregroundColor(.white)
                            }.buttonStyle(DarkorLightButtonStyle())
                            
                            Button(action: {
                                self.device = 2
                            }) {
                                Text("Xbox")
                                    .font(.title)
                                    .fontWeight(.thin)
                                    //.foregroundColor(.white)
                            }.buttonStyle(DarkorLightButtonStyle())
                            
                            Button(action: {
                                self.device = 3
                            }) {
                                Text("Playstation")
                                    .font(.title)
                                    .fontWeight(.thin)
                                    //.foregroundColor(.white)
                            }.buttonStyle(DarkorLightButtonStyle())
                            
                            HStack(alignment:.bottom) {
                                Button("i") {
                                    showSheet = true
                                    showingInformation = true
                                }.buttonStyle(DarkorLightCircleButtonStyle())
                                Spacer()
                            }.padding(.leading, 40)
                        }.padding(.top, 40)
                    }
                }
//                .sheet(isPresented: $showingIntro) {
//                    IntroView()
//                }
//                .sheet(isPresented: $showingInformation) {
//                    InformationView()
//                }
                .sheet(isPresented: $showSheet) {
                    if showingInformation {
                        InformationView()
                    }
                    else if showingIntro {
                        IntroView()
                    }
                }
            }.edgesIgnoringSafeArea(.all)//ZStack
            .navigationBarTitle("Select device").navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MenuView_Previews: PreviewProvider {
    static let pins = Pins()
    static var previews: some View {
        MenuView().environmentObject(pins)
    }
}

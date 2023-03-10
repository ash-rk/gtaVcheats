//
//  IntroView.swift
//  GTA V Cheats
//
//  Created by Ashwin Ravikumar on 03/08/20.
//

import SwiftUI

struct IntroView: View {
    @State private var animationAmount: CGFloat = 1
    @State private var offsetY: CGFloat = 150
    @State private var opacityAmount: Double = 0
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.verticalSizeClass) var sizeClass
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                if sizeClass == .compact {
                    HStack {
                        Text("Welcome to GTA V").fontWeight(.heavy)
                        Text("Cheats").foregroundColor(.orange).fontWeight(.heavy)
                    }
                    .offset(y: offsetY)
                    .opacity(opacityAmount)
                    .animation(
                        Animation.easeOut(duration: 0.5).delay(0.1)
                    )
                    .padding(.bottom, 10)
                }
                
                else {
                    Text("Welcome to").fontWeight(.heavy)
                        .offset(y: offsetY)
                        .opacity(opacityAmount)
                        .animation(
                            Animation.easeOut(duration: 0.5).delay(0.1)
                        )
                    HStack {
                        Text("GTA V").fontWeight(.heavy)
                        Text("Cheats").foregroundColor(.orange).fontWeight(.heavy)
                    }
                    .padding(.bottom, 30)
                        .offset(y: offsetY)
                        .opacity(opacityAmount)
                        .animation(
                            Animation.easeOut(duration: 0.5).delay(0.1)
                        )
                }
            }//Intro VStack close
            .font(.largeTitle)
            .frame(maxWidth: .infinity, maxHeight: 180)
            
            VStack (spacing: 30) {
                HStack (spacing: 20) {
                    Image(systemName: "sparkle")
                        .foregroundColor(.yellow)
                        .font(.title2)
                        .offset(y: offsetY)
                        .opacity(opacityAmount)
                        .animation(
                            Animation.easeOut(duration: 0.5).delay(0.2)
                        )
                        .scaleEffect(animationAmount)
                        
                    VStack (alignment: .leading) {
                        Text("All new design").fontWeight(.semibold)
                        Text("Easily view cheatcodes for Computer, Xbox and Playstation")
                            .foregroundColor(.gray)
                    }
                        .offset(y: offsetY)
                        .opacity(opacityAmount)
                        .animation(
                            Animation.easeOut(duration: 0.5).delay(0.2)
                        )
                    Spacer()
                }//HStack 1
                .padding([.leading, .trailing], 10)
                
                HStack (spacing: 20) {
                    Image(systemName: "pin")
                        .foregroundColor(.red)
                        .font(.title2)
                        .padding(.trailing, 5)
                        .offset(y: offsetY)
                        .opacity(opacityAmount)
                        .animation(
                            Animation.easeOut(duration: 0.5).delay(0.2)
                        )
                        .scaleEffect(animationAmount)

                    VStack (alignment: .leading) {
                        Text("Pin cheat codes").fontWeight(.semibold)
                        Text("You can pin your favourite cheat codes for all devices")
                            .foregroundColor(.gray)
                    }
                        .offset(y: offsetY)
                        .opacity(opacityAmount)
                        .animation(
                            Animation.easeOut(duration: 0.5).delay(0.2)
                        )
                    Spacer()
                }//HStack 2
                .padding([.leading, .trailing], 10)
                
                .frame(maxWidth: .infinity, maxHeight: 100)
                
                HStack (spacing: 20) {
                    Image(systemName: "moon.stars.fill")
                        .foregroundColor(.blue)
                        .font(.title2)
                        .padding(.trailing, 5)
                        .offset(y: offsetY)
                        .opacity(opacityAmount)
                        .animation(
                            Animation.easeOut(duration: 0.5).delay(0.2)
                        )
                        .scaleEffect(animationAmount)
                    
                    VStack (alignment: .leading) {
                        Text("Flexible").fontWeight(.semibold)
                        Text("Supports dark mode")
                            .foregroundColor(.gray)
                    }
                        .offset(y: offsetY)
                        .opacity(opacityAmount)
                        .animation(
                            Animation.easeOut(duration: 0.5).delay(0.2)
                        )
                    Spacer()
                }//HStack 3
                .padding([.leading, .trailing], 10)
                
            }//VStack for 3 criterias
            .padding([.leading, .trailing], 20)
            .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animationAmount)
            .onAppear {
                self.animationAmount = 1.5
            }
                .onAppear {
                    offsetY = 0
                    opacityAmount = 0.8
                    animationAmount = 1.5
                }
                Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
                UserDefaults.standard.set(true, forKey: "LaunchedBefore")
            } label: {
                Text("Continue")
                    .fontWeight(.medium)
                    .padding([.top, .bottom], 15)
                    .padding([.leading, .trailing], 90)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                        .offset(y: offsetY)
                        .opacity(opacityAmount)
                        .animation(
                            Animation.easeOut(duration: 0.5).delay(0.25)
                        )
            }
            .frame(maxWidth: .infinity, maxHeight: 100)

        }//Main VStack
    }
}
struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}

//MARK:- BETA 1
/*
 import SwiftUI

 struct IntroView: View {
     @State private var animationAmount: CGFloat = 1
     @Environment(\.presentationMode) var presentationMode
     let rows = [
         GridItem(.adaptive(minimum: 25))
     ]
     
     var body: some View {
         VStack {
             VStack (alignment: .leading) {
                 LazyHGrid(rows: rows, alignment: .center) {
                     Text("Welcome to GTA V").fontWeight(.heavy)
                     Text("Cheats").foregroundColor(.orange).fontWeight(.heavy)
                 }
             }//Intro VStack close
             .font(.title)
             .padding(.top, 30)
             .frame(maxWidth: .infinity, maxHeight: 150)
             
             VStack (spacing: 30) {
                 HStack (spacing: 20) {
                     Image(systemName: "sparkle")
                         .foregroundColor(.yellow)
                         .font(.title)
                         .scaleEffect(animationAmount)
                         .onAppear {
                             let baseAnimation = Animation.easeInOut(duration: 1)
                             let repeated = baseAnimation.repeatForever(autoreverses: true)
                             return withAnimation(repeated) {
                                 self.animationAmount = 1.5
                             }
                         }
                     VStack (alignment: .leading) {
                         Text("All new design").fontWeight(.semibold)
                         Text("Easily view cheatcodes for Computer, Xbox and Playstation")
                             .foregroundColor(.gray)
                     }
                     Spacer()
                 }//HStack 1
                 
                 HStack (spacing: 20) {
                     Image(systemName: "pin")
                         .foregroundColor(.red)
                         .font(.title)
                         .padding(.trailing, 5)
                         .scaleEffect(animationAmount)
                         .onAppear {
                             let baseAnimation = Animation.easeInOut(duration: 1)
                             let repeated = baseAnimation.repeatForever(autoreverses: true)
                             return withAnimation(repeated) {
                                 self.animationAmount = 1.5
                             }
                         }
                     VStack (alignment: .leading) {
                         Text("Pin cheat codes").fontWeight(.semibold)
                         Text("You can pin your favourite cheat codes for all devices")
                             .foregroundColor(.gray)
                     }
                     Spacer()
                 }//HStack 2
                 .frame(maxWidth: .infinity, maxHeight: 100)
                 
                 HStack (spacing: 20) {
                     Image(systemName: "moon.stars.fill")
                         .foregroundColor(.blue)
                         .font(.title)
                         .scaleEffect(animationAmount)
                         .onAppear {
                             let baseAnimation = Animation.easeInOut(duration: 1)
                             let repeated = baseAnimation.repeatForever(autoreverses: true)
                             return withAnimation(repeated) {
                                 self.animationAmount = 1.5
                             }
                         }
                     VStack (alignment: .leading) {
                         Text("Flexible").fontWeight(.semibold)
                         Text("Supports dark mode")
                             .foregroundColor(.gray)
                     }
                     Spacer()
                 }//HStack 3
             }//VStack for 3 criterias
             .padding([.leading, .trailing], 20)
             
                 Spacer()
             
             Button {
                 presentationMode.wrappedValue.dismiss()
                 UserDefaults.standard.set(true, forKey: "LaunchedBefore")
             } label: {
                 Text("Continue")
                     .fontWeight(.medium)
                     .padding([.top, .bottom], 15)
                     .padding([.leading, .trailing], 90)
                     .background(Color.blue)
                     .foregroundColor(.white)
                     .cornerRadius(15)
             }
             .frame(maxWidth: .infinity, maxHeight: 100)

         }//Main VStack
     }
 }
 struct IntroView_Previews: PreviewProvider {
     static var previews: some View {
         IntroView()
     }
 }
 */

//MARK:- DEMO Code
/*
 import SwiftUI
 
 struct IntroView: View {
     @State private var animationAmount: CGFloat = 1
     @Environment(\.presentationMode) var presentationMode
     @Environment(\.verticalSizeClass) var sizeClass
     
     var body: some View {
         VStack {
             VStack {
                 Spacer()
                 if sizeClass == .compact {
                     HStack {
                         Text("Welcome to Demo").fontWeight(.heavy)
                         Text("App").foregroundColor(.orange).fontWeight(.heavy)
                     }
                     .padding(.bottom, 10)
                 }
                 
                 else {
                     Text("Welcome to").fontWeight(.heavy)
                     HStack {
                         Text("Demo").fontWeight(.heavy)
                         Text("App").foregroundColor(.orange).fontWeight(.heavy)
                     }
                     .padding(.bottom, 30)
                 }
             }//Intro VStack close
             .font(.largeTitle)
             .frame(maxWidth: .infinity, maxHeight: 180)
             
             VStack (spacing: 30) {
                 HStack (spacing: 20) {
                     Image(systemName: "sparkle")
                         .foregroundColor(.yellow)
                         .font(.title2)
                         .scaleEffect(animationAmount)
                         .onAppear {
                             let baseAnimation = Animation.easeInOut(duration: 1)
                             let repeated = baseAnimation.repeatForever(autoreverses: true)
                             return withAnimation(repeated) {
                                 self.animationAmount = 1.5
                             }
                         }
                     VStack (alignment: .leading) {
                         Text("All new design").fontWeight(.semibold)
                         Text("Easily view all your essentials here.")
                             .foregroundColor(.gray)
                     }
                     Spacer()
                 }//HStack 1
                 .padding([.leading, .trailing], 10)
                 
                 HStack (spacing: 20) {
                     Image(systemName: "pin")
                         .foregroundColor(.red)
                         .font(.title2)
                         .padding(.trailing, 5)
                         .scaleEffect(animationAmount)
                         .onAppear {
                             let baseAnimation = Animation.easeInOut(duration: 1)
                             let repeated = baseAnimation.repeatForever(autoreverses: true)
                             return withAnimation(repeated) {
                                 self.animationAmount = 1.5
                             }
                         }
                     VStack (alignment: .leading) {
                         Text("Pin favourites").fontWeight(.semibold)
                         Text("You can pin your favourite content on all devices")
                             .foregroundColor(.gray)
                     }
                     Spacer()
                 }//HStack 2
                 .padding([.leading, .trailing], 10)
                 
                 .frame(maxWidth: .infinity, maxHeight: 100)
                 
                 HStack (spacing: 20) {
                     Image(systemName: "moon.stars.fill")
                         .foregroundColor(.blue)
                         .font(.title2)
                         .scaleEffect(animationAmount)
                         .onAppear {
                             let baseAnimation = Animation.easeInOut(duration: 1)
                             let repeated = baseAnimation.repeatForever(autoreverses: true)
                             return withAnimation(repeated) {
                                 self.animationAmount = 1.5
                             }
                         }
                     VStack (alignment: .leading) {
                         Text("Flexible").fontWeight(.semibold)
                         Text("Supports dark mode")
                             .foregroundColor(.gray)
                     }
                     Spacer()
                 }//HStack 3
                 .padding([.leading, .trailing], 10)
                 
             }//VStack for 3 criterias
             .padding([.leading, .trailing], 20)
             
                 Spacer()
             
             Button {
                 presentationMode.wrappedValue.dismiss()
                 UserDefaults.standard.set(true, forKey: "LaunchedBefore")
             } label: {
                 Text("Continue")
                     .fontWeight(.medium)
                     .padding([.top, .bottom], 15)
                     .padding([.leading, .trailing], 90)
                     .background(Color.blue)
                     .foregroundColor(.white)
                     .cornerRadius(15)
             }
             .frame(maxWidth: .infinity, maxHeight: 100)

         }//Main VStack
     }
 }
 struct IntroView_Previews: PreviewProvider {
     static var previews: some View {
         IntroView()
     }
 }
 */


//MARK:- BETA 2

/*
 import SwiftUI

 struct IntroView: View {
     @State private var animationAmount: CGFloat = 1
     @Environment(\.presentationMode) var presentationMode
     @Environment(\.verticalSizeClass) var sizeClass
     
     var body: some View {
         VStack {
             VStack {
                 Spacer()
                 if sizeClass == .compact {
                     HStack {
                         Text("Welcome to GTA V").fontWeight(.heavy)
                         Text("Cheats").foregroundColor(.orange).fontWeight(.heavy)
                     }
                     .padding(.bottom, 10)
                 }
                 
                 else {
                     Text("Welcome to").fontWeight(.heavy)
                     HStack {
                         Text("GTA V").fontWeight(.heavy)
                         Text("Cheats").foregroundColor(.orange).fontWeight(.heavy)
                     }
                     .padding(.bottom, 30)
                 }
             }//Intro VStack close
             .font(.largeTitle)
             .frame(maxWidth: .infinity, maxHeight: 180)
             
             VStack (spacing: 30) {
                 HStack (spacing: 20) {
                     Image(systemName: "sparkle")
                         .foregroundColor(.yellow)
                         .font(.title2)
                         .scaleEffect(animationAmount)
                         .onAppear {
                             let baseAnimation = Animation.easeInOut(duration: 1)
                             let repeated = baseAnimation.repeatForever(autoreverses: true)
                             return withAnimation(repeated) {
                                 self.animationAmount = 1.5
                             }
                         }
                     VStack (alignment: .leading) {
                         Text("All new design").fontWeight(.semibold)
                         Text("Easily view cheatcodes for Computer, Xbox and Playstation")
                             .foregroundColor(.gray)
                     }
                     Spacer()
                 }//HStack 1
                 .padding([.leading, .trailing], 10)
                 
                 HStack (spacing: 20) {
                     Image(systemName: "pin")
                         .foregroundColor(.red)
                         .font(.title2)
                         .padding(.trailing, 5)
                         .scaleEffect(animationAmount)
                         .onAppear {
                             let baseAnimation = Animation.easeInOut(duration: 1)
                             let repeated = baseAnimation.repeatForever(autoreverses: true)
                             return withAnimation(repeated) {
                                 self.animationAmount = 1.5
                             }
                         }
                     VStack (alignment: .leading) {
                         Text("Pin cheat codes").fontWeight(.semibold)
                         Text("You can pin your favourite cheat codes for all devices")
                             .foregroundColor(.gray)
                     }
                     Spacer()
                 }//HStack 2
                 .padding([.leading, .trailing], 10)
                 
                 .frame(maxWidth: .infinity, maxHeight: 100)
                 
                 HStack (spacing: 20) {
                     Image(systemName: "moon.stars.fill")
                         .foregroundColor(.blue)
                         .font(.title2)
                         .scaleEffect(animationAmount)
                         .onAppear {
                             let baseAnimation = Animation.easeInOut(duration: 1)
                             let repeated = baseAnimation.repeatForever(autoreverses: true)
                             return withAnimation(repeated) {
                                 self.animationAmount = 1.5
                             }
                         }
                     VStack (alignment: .leading) {
                         Text("Flexible").fontWeight(.semibold)
                         Text("Supports dark mode")
                             .foregroundColor(.gray)
                     }
                     Spacer()
                 }//HStack 3
                 .padding([.leading, .trailing], 10)
                 
             }//VStack for 3 criterias
             .padding([.leading, .trailing], 20)
             
                 Spacer()
             
             Button {
                 presentationMode.wrappedValue.dismiss()
                 UserDefaults.standard.set(true, forKey: "LaunchedBefore")
             } label: {
                 Text("Continue")
                     .fontWeight(.medium)
                     .padding([.top, .bottom], 15)
                     .padding([.leading, .trailing], 90)
                     .background(Color.blue)
                     .foregroundColor(.white)
                     .cornerRadius(15)
             }
             .frame(maxWidth: .infinity, maxHeight: 100)

         }//Main VStack
     }
 }
 struct IntroView_Previews: PreviewProvider {
     static var previews: some View {
         IntroView()
     }
 }
 */

//MARK:- BETA 3

//import SwiftUI
//
//struct IntroView: View {
//    @State private var animationAmount: CGFloat = 1
//    @State private var offsetY: CGFloat = 150
//    @State private var opacityAmount: Double = 0
//    @Environment(\.presentationMode) var presentationMode
//    @Environment(\.verticalSizeClass) var sizeClass
//
//    var body: some View {
//        VStack {
//            VStack {
//                Spacer()
//                if sizeClass == .compact {
//                    HStack {
//                        Text("Welcome to GTA V").fontWeight(.heavy)
//                        Text("Cheats").foregroundColor(.orange).fontWeight(.heavy)
//                    }
//                    .offset(y: offsetY)
//                    .opacity(opacityAmount)
//                    .animation(
//                        Animation.easeOut(duration: 0.5).delay(0.1)
//                    )
//                    .padding(.bottom, 10)
//                }
//
//                else {
//                    Text("Welcome to").fontWeight(.heavy)
//                        .offset(y: offsetY)
//                        .opacity(opacityAmount)
//                        .animation(
//                            Animation.easeOut(duration: 0.5).delay(0.1)
//                        )
//                    HStack {
//                        Text("GTA V").fontWeight(.heavy)
//                        Text("Cheats").foregroundColor(.orange).fontWeight(.heavy)
//                    }
//                    .padding(.bottom, 30)
//                        .offset(y: offsetY)
//                        .opacity(opacityAmount)
//                        .animation(
//                            Animation.easeOut(duration: 0.5).delay(0.1)
//                        )
//                }
//            }//Intro VStack close
//            .font(.largeTitle)
//            .frame(maxWidth: .infinity, maxHeight: 180)
//
//            VStack (spacing: 30) {
//                HStack (spacing: 20) {
//                    Image(systemName: "sparkle")
//                        .foregroundColor(.yellow)
//                        .font(.title2)
//                        .offset(y: offsetY)
//                        .opacity(opacityAmount)
//                        .animation(
//                            Animation.easeOut(duration: 0.5).delay(0.2)
//                        )
//                        .scaleEffect(animationAmount)
//
//                    VStack (alignment: .leading) {
//                        Text("All new design").fontWeight(.semibold)
//                        Text("Easily view cheatcodes for Computer, Xbox and Playstation")
//                            .foregroundColor(.gray)
//                    }
//                        .offset(y: offsetY)
//                        .opacity(opacityAmount)
//                        .animation(
//                            Animation.easeOut(duration: 0.5).delay(0.2)
//                        )
//                    Spacer()
//                }//HStack 1
//                .padding([.leading, .trailing], 10)
//
//                HStack (spacing: 20) {
//                    Image(systemName: "pin")
//                        .foregroundColor(.red)
//                        .font(.title2)
//                        .padding(.trailing, 5)
//                        .offset(y: offsetY)
//                        .opacity(opacityAmount)
//                        .animation(
//                            Animation.easeOut(duration: 0.5).delay(0.2)
//                        )
//                        .scaleEffect(animationAmount)
//
//                    VStack (alignment: .leading) {
//                        Text("Pin cheat codes").fontWeight(.semibold)
//                        Text("You can pin your favourite cheat codes for all devices")
//                            .foregroundColor(.gray)
//                    }
//                        .offset(y: offsetY)
//                        .opacity(opacityAmount)
//                        .animation(
//                            Animation.easeOut(duration: 0.5).delay(0.2)
//                        )
//                    Spacer()
//                }//HStack 2
//                .padding([.leading, .trailing], 10)
//
//                .frame(maxWidth: .infinity, maxHeight: 100)
//
//                HStack (spacing: 20) {
//                    Image(systemName: "moon.stars.fill")
//                        .foregroundColor(.blue)
//                        .font(.title2)
//                        .padding(.trailing, 5)
//                        .offset(y: offsetY)
//                        .opacity(opacityAmount)
//                        .animation(
//                            Animation.easeOut(duration: 0.5).delay(0.2)
//                        )
//                        .scaleEffect(animationAmount)
//
//                    VStack (alignment: .leading) {
//                        Text("Flexible").fontWeight(.semibold)
//                        Text("Supports dark mode")
//                            .foregroundColor(.gray)
//                    }
//                        .offset(y: offsetY)
//                        .opacity(opacityAmount)
//                        .animation(
//                            Animation.easeOut(duration: 0.5).delay(0.2)
//                        )
//                    Spacer()
//                }//HStack 3
//                .padding([.leading, .trailing], 10)
//
//            }//VStack for 3 criterias
//            .padding([.leading, .trailing], 20)
//            .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animationAmount)
//            .onAppear {
//                self.animationAmount = 1.5
//            }
//                .onAppear {
//                    offsetY = 0
//                    opacityAmount = 0.8
//                    animationAmount = 1.5
//                }
//                Spacer()
//
//            Button {
//                presentationMode.wrappedValue.dismiss()
//                UserDefaults.standard.set(true, forKey: "LaunchedBefore")
//            } label: {
//                Text("Continue")
//                    .fontWeight(.medium)
//                    .padding([.top, .bottom], 15)
//                    .padding([.leading, .trailing], 90)
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(15)
//                        .offset(y: offsetY)
//                        .opacity(opacityAmount)
//                        .animation(
//                            Animation.easeOut(duration: 0.5).delay(0.25)
//                        )
//            }
//            .frame(maxWidth: .infinity, maxHeight: 100)
//
//        }//Main VStack
//    }
//}
//struct IntroView_Previews: PreviewProvider {
//    static var previews: some View {
//        IntroView()
//    }
//}

//
//  ContentView.swift
//  SeanAllenWeatherApp
//
//  Created by alternatifbank on 13.01.2025.
//

import SwiftUI
struct ContentView: View {
    
    @State private var isNight = false
    // Assets kendi colorumu tanımladım ve import ettim.
    // Tek bir renk olmayacağı için uygulamamız linearGradient kullandık.
    // tepeden soldan blue sağ aşağıdan beyaz renk olucak dedik.
   
    
    var body: some View {
        ZStack {
            /// THEME  Renkleri
            BackgroundView(isNight: isNight)
   
           /// TİTLE
            VStack{
               CityTextView(cityName: "Cupertiono, CA")
                 /// Dark/Light Mode  Hava Durumu
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" :  "cloud.sun.fill",
                    temperature: "76°")

                /// Hava Durumu
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE",
                                   dayOfImage: "cloud.sun.fill",
                                   temperature: "76°")
                    WeatherDayView(dayOfWeek: "WED",
                                   dayOfImage: "sun.max.fill",
                                   temperature: "74°")
                    WeatherDayView(dayOfWeek: "THU",
                                   dayOfImage: "wind.snow",
                                   temperature: "68°")
                    WeatherDayView(dayOfWeek: "FRI",
                                   dayOfImage: "sunset.fill",
                                   temperature: "72°")
                    WeatherDayView(dayOfWeek: "SAT",
                                   dayOfImage: "snow",
                                   temperature: "25°")
                }
                Spacer()
                /// Change Day Time
                Button {
                    // True'dan false geçiş ypaacak.
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .white, backgroundColor: .mint)
                }
            
                Spacer()
                
            }
        }
    }
}

struct WeatherDayView : View {
    var dayOfWeek : String
    var dayOfImage: String
    var temperature: String
    
    var body: some View {
        VStack {
           Text(dayOfWeek)
               .font(.system(size: 28, weight: .medium, design: .default))
               .foregroundColor(.white)
           Image(systemName: dayOfImage)
                .symbolRenderingMode(.palette) // SF Symbols paleti.
               .resizable()
            // Eğer plaetimizin tek bir katmanı varsa WED örneği tek renk.
            // Bu bize pink rengini verir.
            
            // Eğer 2 katmanlıysa pink ve orange'dan oluşur.
            
            // Eğer 3 katmanlıysa pink orange greenden oluşur.
               .foregroundStyle(.pink, .orange, .green)
               .aspectRatio(contentMode: .fit)
               .frame(width: 40, height: 40)
           Text("\(temperature)")
               .font(.system(size: 28, weight: .medium))
               .foregroundColor(.white)
       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherButton : View {
    
    var title : String
    var textColor : Color
    var backgroundColor : Color
    
    var body: some View {
            Text(title)
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(10)
                .foregroundColor(textColor)
        
    }
}

struct MainWeatherStatusView : View {
   
    var imageName: String
    var temperature : String
    
    var body: some View  {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original) //Resmin orjinal haliyle tutar.
                .resizable()
                .aspectRatio(contentMode: .fit) // Görünümü kare tuttum. istediğimiz için fit dedik.
                .frame(width: 180, height: 180)
            
            Text("\(temperature)")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom,40)
    }
}

struct BackgroundView: View {
    
   var isNight: Bool

    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .edgesIgnoringSafeArea(.all)
        
        // İOS 16 ve üzerini destekliyor.
//        ContainerRelativeShape()
//            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
//            .ignoresSafeArea()
    }
}


struct CityTextView : View  {
    
    var cityName : String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

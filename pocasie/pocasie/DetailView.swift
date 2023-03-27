//
//  DetailView.swift
//  pocasie
//
//  Created by Daniel Németh on 21/12/2022.
//

import SwiftUI

struct DetailView: View {
    let lokalita: Lokality
    
    var body: some View {
        Text(lokalita.name)
        Text("\(lokalita.latitude)")
        Text("\(lokalita.longitude)")
            .onAppear {
                stiahniData(lat: lokalita.latitude, lon: lokalita.longitude)
            }
        
    }
    func stiahniData(lat: Double, lon: Double) {
        
        let urlString =
        
        "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(lon)&exclude=minutely,hourly,alerts&appid=\(APIKey.appID)&units=metric"
        
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("Missing data!")
                return
            }
            
            if let json = try? JSONSerialization.jsonObject(with: data) {
                print(json)
            }
        }
        
        task.resume()
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let bs = Lokality(name: "Banská Štiavnica", latitude: 48.4587, longitude: 18.8931)
        Group {
            DetailView(lokalita: bs)
            DetailView(lokalita: bs)
        }
    }
    
}

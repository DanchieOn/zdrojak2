//
//  ContentView.swift
//  pocasie
//
//  Created by Daniel Németh on 21/12/2022.
//
import MapKit
import SwiftUI
// prvotne zobrazenie mapy - definicia stredu krajiny
struct ContentView: View {
    @State private var mapView = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.92, longitude: 19.64),
        span: MKCoordinateSpan(latitudeDelta: 7, longitudeDelta: 7)
    )
    // definicia pinov
    let lokality = [
        Lokality(name: "Banská Štiavnica", latitude: 48.4587, longitude: 18.8931),
        Lokality(name: "Košice", latitude: 48.7203, longitude: 21.2574)
    ]
            // zobrazenie danych pinov
            var body: some View {
                NavigationView {
                    Map(coordinateRegion: $mapView, annotationItems: lokality) { lokalita in MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: lokalita.latitude, longitude: lokalita.longitude)) {
                       
                        NavigationLink {
                            DetailView(lokalita: lokalita)
                        } label: {
                            VStack {
                                Image(systemName: "mappin.circle.fill")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.red)
                                
                                Text(lokalita.name)
                                    .foregroundColor(.primary)
                                    .font(.caption)
                            }
                        }

                    }
                        
            }
            .ignoresSafeArea()
                
        }
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

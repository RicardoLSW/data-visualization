//
//  ContentView.swift
//  data-visualization
//
//  Created by 骆顺旺 on 2020/8/4.
//

import Foundation
import SwiftUI
import UIKit


struct ContentView: View {
    var body: some View {
        TabView {
            MapView().edgesIgnoringSafeArea(.all)
                .tabItem {
                    Image(systemName: "star")
                    Text("One")
                }

            Text("Tab 2")
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Two")
                }
            Text("Tab 3")
                .tabItem {
                    Image(systemName: "star")
                    Text("Three")
                }

            Text("Tab 4")
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Four")
                }
            Text("Tab 5")
                .tabItem {
                    Image(systemName: "star")
                    Text("Five")
                }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

struct MapView: UIViewRepresentable {
    func updateUIView(_ uiView: MAMapView, context: Context) {}
    
    typealias UIViewType = MAMapView
    
    func makeUIView(context: Context) -> MAMapView {
        AMapServices.shared()?.apiKey = "6c17b0a5b58d47e0f769809b1a16ee71"
        let mapView = MAMapView(frame: CGRect(x: 0, y: 0, width: 400, height: 500))
        var path = Bundle.main.bundlePath
        path.append("/style.data")
        let data = NSData.init(contentsOfFile: path)
        let options = MAMapCustomStyleOptions.init()
        options.styleData = data! as Data
        mapView.setCustomMapStyleOptions(options)
        mapView.customMapStyleEnabled = true;
        return mapView
    }
}

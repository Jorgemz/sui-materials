//
//  ContentView.swift
//  MountainAirportMac
//
//  Created by 🤨 on 25/05/21.
//

import SwiftUI

struct ContentView: View {
  @StateObject var flightInfo = FlightData()
  
  @SceneStorage("displayState") var displayState: DisplayState = .none
  @SceneStorage("lastViewedFlightID") var lastViewedFlightID: Int?
  @SceneStorage("selectedFlightID") var selectedFlightID: Int?
  
  var selectedFlight: FlightInformation? {
    if let id = selectedFlightID {
      return flightInfo.getFlightById(id)
    }
    return nil
  }
  
  var lastViewedFlight: FlightInformation? {
    if let id = lastViewedFlightID {
      return flightInfo.getFlightById(id)
    }
    return nil
  }
  
  var body: some View {
    NavigationView {
      WelcomeView(flightInfo: flightInfo)
      // 1
      switch displayState {
        case .none:
          // 2
          EmptyView()
        case .flightBoard:
          // 3
          HStack {
            FlightStatusBoard(flights: flightInfo.getDaysFlights(Date()))
            FlightDetails(flight: selectedFlight)
          }
        // 4
        case .searchFlights:
          SearchFlights(flightData: flightInfo.flights)
        case .awards:
          AwardsView()
        case .lastFlight:
          FlightDetails(flight: lastViewedFlight)
      }
      
    }
    .navigationTitle("Mountain Airport")
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

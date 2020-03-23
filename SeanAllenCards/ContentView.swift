//
//  ContentView.swift
//  SeanAllenCards
//
//  Created by Daniel O'Leary on 3/23/20.
//  Copyright © 2020 Impulse Coupled Development. All rights reserved.
//

import SwiftUI

struct CardImages {
	let hearts = Image("KH")
	let diamonds = Image("KD")
	let clubs = Image("KC")
	let spades = Image("KS")
	let joker = Image("joker")
}

struct ContentView: View {
	@State private var pickerSelection = 1
	
	let cards = ["♠️", "♥️", "♣️", "♦️"]
	
    var body: some View {
		NavigationView {
			VStack {
				suitDidChange(selection: pickerSelection)
					.resizable()
					.scaledToFit()
					.frame(width: 250, height: 500, alignment: .center)
				Picker("Card", selection: $pickerSelection) {
					ForEach(0..<cards.count) {
						Text("\(self.cards[$0])")
					}
				}
				.pickerStyle(SegmentedPickerStyle())
				.padding(EdgeInsets(top: 20, leading: 15, bottom: 0, trailing: 15))
			}
			.navigationBarTitle("S. Allen Cards")
		}
    }
	
	func suitDidChange(selection: Int) -> Image {
		let images = CardImages()
		switch selection {
			case 0:
				return images.spades
			case 1:
				return images.hearts
			case 2:
				return images.clubs
			case 3:
				return images.diamonds
			default:
				return images.joker
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

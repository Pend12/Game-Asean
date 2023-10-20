import SwiftUI

struct ContentView: View {
    var asean = ["Indonesia", "Singapore", "Malaysia", "Laos", "Philipines", "Cambodia", "Myanmar", "Thailand", "Brunei", "Vietnam"]
    
    @State private var alertShown = false
    @State private var betul : Int = 0
    @State private var currentCountry: String = ""
    @State private var selectedCountry: [String] = []

    func countryRandom() {
        if selectedCountry.count < 10 {
            var randomCountry = asean.randomElement()!
            while selectedCountry.contains(randomCountry) {
                randomCountry = asean.randomElement()!
            }
            currentCountry = randomCountry
            selectedCountry.append(randomCountry)
        }
    }

    func PencetCountry(number: Int) {
        if asean[number] == currentCountry {
            betul += 1
        }
        if selectedCountry.count == 10 {
            alertShown = true
        }
        countryRandom()
    }

    var body: some View {
        ZStack {
            Color.mint
                .ignoresSafeArea()
            VStack {
                Text("Pilih Bendera dari Negara : ")
                    .foregroundColor(.black)
                Text(currentCountry)
                    .foregroundColor(.black)
            }
        }
        .onAppear() {
            countryRandom()
        }

        HStack {
            Spacer()
            VStack {
                ForEach(0 ..< 5, id: \.self) { number in
                    Button {
                        PencetCountry(number: number)
                    } label: {
                        Image(asean[number])
                            .resizable()
                            .frame(width: 105, height: 65)
                    }
                }
            }
            Spacer()
            VStack {
                ForEach(5 ..< 10, id: \.self) { number in
                    Button {
                        PencetCountry(number: number)
                    } label: {
                        Image(asean[number])
                            .resizable()
                            .frame(width: 105, height: 65)
                    }
                }
            }
            Spacer()
        }
        .alert("WoW", isPresented: $alertShown) {
            Button("Main Lagi", role: .cancel) {
                selectedCountry = []
                betul = 0
                countryRandom()
                alertShown = false
            }
        } message: {
            Text("Kamu benar \(betul) Dari 10 Negara ASEAN.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


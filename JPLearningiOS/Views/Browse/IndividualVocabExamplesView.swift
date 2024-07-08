//
//  IndividualVocabExamplesView.swift
//  JPLearningiOS
//
//  Created by Numasawa, Moe on 2024-06-11.
//

import SwiftUI

struct IndividualVocabExamplesView: View {
    init() {
        UISegmentedControl.appearance().apportionsSegmentWidthsByContent = true
    }
    @State var exampleSelected: String = "A"
    
    var body: some View {
        VStack (alignment: .leading, spacing: 15) {
            VocabExamplesPicker(exampleSelected: $exampleSelected)
            if exampleSelected == "MyList" {
                
            } else {
                ExampleView(exampleSelected: $exampleSelected)
                ExampleContextView()
                ExampleNoteView()
                ExampleAdditionalLearningView()
            }
        }
    }
}

struct VocabExamplesPicker: View {
    
    @Binding var exampleSelected: String
    
    let exampleOptions = ["A", "B", "C", "D", "E", "F", "G", "H", "MyList"]
    
    var body: some View {
        Picker("Select Example", selection: $exampleSelected) {
            ForEach(exampleOptions, id: \.self) { option in
                Text(option)
                    .tag(option)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct ExampleView: View {
    @Binding var exampleSelected: String
    @AppStorage("hideJapanese") var hide: Bool = false
    
    var body: some View {
        ZStack {
            Color("background-grey")
            
            VStack (alignment: .center, spacing: 20) {
                VStack (alignment: .leading, spacing: 10) {
                    ZStack {
                        Text("記憶がちょっと曖昧なんだけど、間違いなくこの店には来たことがある。")
                            .font(.system(size: 15))
                        if hide {
                            Color("background-grey")
                            Image("ViewHideIcon")
                        }
                    }.fixedSize(horizontal: false, vertical: true)
                    
                    Text("My memory is a bit hazy, but I’m sure I’ve been to this restaurant before. ")
                        .font(.system(size: 14))
                }
                
                HStack (alignment: .center, spacing: 20) {
                    Button(action: {
                        // Action for Archieve Button
                    }) {
                        Image("ArchieveIcon")
                    }
                    Button(action: {
                        // Action for Sound Button
                    }) {
                        Image("SoundIconBlack")
                    }
//                    Button(action: {
//                        // Action for Bookmark button
//                    }) {
//                        Image("BookmarkIcon")
//                    }
                }
            }
            .padding(10)
        }
        .cornerRadius(5)
        .fixedSize(horizontal: false, vertical: true)
        
    }
}

struct ExampleContextView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text("Context")
                .font(.system(size: 14))
                .fontWeight(.bold)
                .foregroundColor(Color("primary-blue"))
            ZStack (alignment: .leading) {
                Color("background-grey")
                Text("When asked about your experiences by a friend who is planning to travel to Taiwan next month, you share that you've visited Taiwan about three times before.")
                .font(.system(size: 14))
                .padding(10)
            }
            .cornerRadius(5)
            .fixedSize(horizontal: false, vertical: true)
        }
    }
}

struct ExampleNoteView: View {
    // TODO check if note for the example selected exists
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text("Note")
                .font(.system(size: 14))
                .fontWeight(.bold)
                .foregroundColor(Color("primary-blue"))
            ZStack {
                Color("background-grey")
                Button(action: {
                    
                }) {
                    HStack (spacing: 8) {
                        Text("Add Note")
                            .font(.system(size: 14))
                            .foregroundColor(Color("icon-primary"))
                        Image("AddIcon")
                    }.padding(10)
                }
            }
            .cornerRadius(5)
            .fixedSize(horizontal: false, vertical: true)
        }
    }
}

struct ExampleAdditionalLearningView: View {
    @State private var showAdditionalLearning = false
    
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text("Additional Learning")
                .font(.system(size: 14))
                .fontWeight(.bold)
                .foregroundColor(Color("primary-blue"))
            Button(action: {
                showAdditionalLearning.toggle()
            }) {
                ZStack (alignment: .leading) {
                    Color("background-grey")
                    VStack (alignment: .leading, spacing: 3) {
                        Text("まちがいなく")
                            .font(.system(size: 15))
                            .foregroundColor(Color("black"))
                        Text("Undoubtedly")
                            .font(.system(size: 12))
                            .foregroundColor(Color("icon-primary"))
                    }.padding(10)
                }
                .cornerRadius(5)
                .fixedSize(horizontal: false, vertical: true)
            }
            .sheet(isPresented: $showAdditionalLearning) {
                AdditionalLearningPopup()
                    .presentationDragIndicator(.hidden)
            }
            
        }
    }
}

struct AdditionalLearningPopup: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            HStack {
                Spacer()
                VStack (spacing: 0) {
                    Text("まちがいなく")
                        .font(.system(size: 20))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text("Undoubtedly")
                        .font(.system(size: 16))
                }.padding(.vertical, 20)
                Spacer()
            }
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color("light-grey"))
            Text("We can say that we \"have done\" something by putting a verb into Vた plain past tense and adding ～ことがある to the end of it.")
                .font(.system(size: 14))
                .padding(.vertical, 15)
            VStack (alignment: .leading, spacing: 5) {
                Text("Examples")
                    .font(.system(size: 14))
                    .fontWeight(.bold)
                    .foregroundColor(Color("primary-blue"))
                ZStack (alignment: .leading) {
                    Color("white")
                    VStack (alignment: .leading, spacing: 5) {
                        Text("大谷翔平は間違いなく日本の宝")
                            .font(.system(size: 15))
                        Text("Shohei Ohtani is undoubtedly a national treasure of Japan.")
                        .font(.system(size: 14))
                    }
                    .padding(10)
                    
                }
                .cornerRadius(5)
                .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.bottom, 10)
            ExampleNoteView()
            
            Spacer()
        }
        .padding(.horizontal, 30)
        .background(Color("background-grey"))
    }
}

#Preview {
    IndividualVocabExamplesView()
}

//
//  BrowseView.swift
//  JPLearningiOS
//
//  Created by Numasawa, Moe on 2024-05-19.
//

import SwiftUI

struct BrowseView: View {
    @State private var showSettings = false
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text("Browse")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                Spacer()
                HStack {
                    Image("SearchIcon")
                    Image("QuestionIcon")
                    
                    Button(action: {
                        showSettings.toggle()
                    }) {
                        Image("SettingsIcon")
                    }
                    .sheet(isPresented: $showSettings) {
                        SettingsView(showSettings: $showSettings)
                            .presentationDetents([.fraction(0.28)])
                            .presentationDragIndicator(.hidden)
                    }
                }
            }.padding(.horizontal, 30)
            // Add scrollable contents
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(1...20, id: \.self) { item in
                        VocabularyCard()
                    }
                }.padding([.leading, .trailing], 6)
            }.padding(.horizontal, 24)
        }
    }
}

struct VocabularyCard: View {
    var body: some View {
        NavigationLink(destination: VocabDetailView()) {
            HStack(spacing: 20) {
                Text("001")
                    .foregroundColor(Color("primary-orange"))
                    .font(.system(size: 16))
                    .bold()
                VStack(alignment: .leading, spacing: 4) {
                    Text("〜たことがある")
                        .font(.system(size: 14))
                    Text("have done")
                        .font(.system(size: 12))
                }
                Spacer()
            }
            .padding(.horizontal, 18)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 4)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct SettingsView: View {
    @Binding var showSettings: Bool
    @State private var displaySetting: String = "OFF"
    @State private var audioSetting: String = "Man"
    let audioOptions = ["Man", "Woman", "Man (young)", "Woman (young)"]
    
    var body: some View {
        ZStack (alignment: .top) {
            HStack (alignment: .top) {
                Spacer()
                Button(action: {
                        showSettings = false
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 20))
                            .foregroundColor(.primary)
                    }
            }
            .padding(30)
            
            VStack (alignment: .leading, spacing: 5) {
                
                Text("Display Setting")
                    .font(.system(size: 16))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                HStack (spacing: 0) {
                    Text("Select if you want to show ")
                        .font(.system(size: 13))
                    Text("furigana ")
                        .font(.system(size: 13))
                        .fontWeight(.bold)
                    Text("(e.g. 日本)")
                        .font(.system(size: 13))
                }
                
                Picker("Show Furigana", selection: $displaySetting) {
                    Text("ON").tag("ON")
                    Text("OFF").tag("OFF")
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 150)
                .padding(.bottom, 15)

                Text("Audio Setting")
                    .font(.system(size: 16))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                HStack (spacing: 0) {
                    Text("Select your desired ")
                        .font(.system(size: 13))
                    Text("voice style")
                        .font(.system(size: 13))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack (alignment: .center, spacing: 10) {
                        ForEach(audioOptions, id: \.self) { option in
                            Button(action: {
                                audioSetting = option
                            }) {
                                Text(option)
                                    .font(.system(size: 14))
                                    .foregroundColor(audioSetting == option ? Color("primary-purple") : .primary)
                                    .frame(minWidth: 70)
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 10)
                                    .background(
                                        RoundedRectangle(cornerRadius: 6)
                                            .stroke(audioSetting == option ? Color("primary-purple") : Color("icon-primary"), lineWidth: 0.8)
                                            .fill(audioSetting == option ? Color("primary-purple").opacity(0.06) : .clear)
                                    )
                            }
                        }
                    }
                    .padding(.vertical, 2)
                }
                .padding(.bottom, 10)
                Spacer()
            }
            .padding([.top, .horizontal], 30)
        }
    }
}

#Preview {
    BrowseView()
}

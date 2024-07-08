//
//  BrowseDetailView.swift
//  JPLearningiOS
//
//  Created by Numasawa, Moe on 2024-05-20.
//

import SwiftUI

struct IndividualVocabView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showSettings = false
    @State var displayOption: String = "Examples"

    var body: some View {
        VStack (spacing: 0) {
            Rectangle()
                .fill(Color("light-grey"))
                .frame(height: 1)
            
            ScrollView (showsIndicators: false) {
                VStack(spacing: 25) {
                    VocabMeaningView()
                    VocabDisplayPicker(displayOption: $displayOption)
                    if displayOption == "Details" {
                        IndividualVocabDetailsView()
                    } else {
                        IndividualVocabExamplesView()
                    }
                    
                }
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 0)
            
            VocabMenuBar()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 14))
                        Text("Browse")
                            .font(.system(size: 16))
                    }
                    .padding(.leading, 10)
                }
            }
            ToolbarItem(placement: .principal) {
                Text("001")
                    .padding(.vertical, 3)
                    .padding(.horizontal, 18)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color("primary-orange").opacity(0.7),
                                        Color("primary-orange").opacity(0.25)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                    )
                    .font(.system(size: 16))
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showSettings.toggle()
                }) {
                    Image("SettingsIcon")
                        .padding(.trailing, 10)
                }
                .sheet(isPresented: $showSettings) {
                    SettingsView(showSettings: $showSettings, showDisplaySetting: false)
                        .presentationDetents([.fraction(0.15)])
                        .presentationDragIndicator(.hidden)
                }
            }
        }
    }
}

struct VocabMenuBar: View {
    @State private var bookmarked: Bool = false
    @State private var isReview: Bool = false
    @AppStorage("hideJapanese") var hide: Bool = false
    @AppStorage("showFurigana") var showFurigana: Bool = false
    @State private var showSettings = false
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color("light-grey"))
                .frame(height: 1)
            HStack(alignment: .center, spacing: 18) {
                Button(action: {
                    // Action for FavoriteIcon button
                    bookmarked.toggle()
                }) {
                    Image(bookmarked ? "BookmarkFillIcon" : "BookmarkIcon")
                        .resizable()
                        .frame(width: 22, height: 28)
                }
                .padding(.horizontal, 4)
                
                Button(action: {
                    hide.toggle()
                }) {
                    Image(hide ? "ViewHideIcon" : "ViewIcon")
                }
                
                Button(action: {
                    // Action for Furigana button
                    showFurigana.toggle()
                }) {
                    Text("Furigana")
                        .font(.system(size: 14))
                        .foregroundColor(showFurigana ? Color("primary-purple") : .primary)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 10)
                        .background(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(showFurigana ? Color("primary-purple") : Color("icon-primary"), lineWidth: 0.8)
                                .fill(showFurigana ? Color("primary-purple").opacity(0.06) : .clear)
                        )
                }
                
                Button(action: {
                    showSettings.toggle()
                }) {
                    Image("MicIcon")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .sheet(isPresented: $showSettings) {
                    SettingsView(showSettings: $showSettings, showDisplaySetting: false)
                        .presentationDetents([.fraction(0.15)])
                        .presentationDragIndicator(.hidden)
                }

                HStack (spacing: 10) {
                    Button(action: {
                        // Action for left arrow button
                    }) {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 18))
                            .fontWeight(.light)
                            .foregroundColor(Color("primary-purple"))
                    }

                    Button(action: {
                        // Action for right arrow button
                    }) {
                        Image(systemName: "arrow.right")
                            .font(.system(size: 18))
                            .fontWeight(.light)
                            .foregroundColor(Color("primary-purple"))
                    }
                }
            }
            .frame(height: 55)
        }
        
    }
}

struct VocabMeaningView: View {
    
    var body: some View {
        VStack (spacing: 0) {
            VStack (spacing: 0) {
                Text("〜たことがある")
                    .font(.system(size: 20))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("have done")
                    .font(.system(size: 16))
            }.padding(.vertical, 20)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color("light-grey"))
            Text("We can say that we \"have done\" something by putting a verb into Vた plain past tense and adding ～ことがある to the end of it.")
                .font(.system(size: 14))
                .padding(.top, 15)
        }
    }
}

struct VocabDisplayPicker: View {
    @Binding var displayOption: String
    
    var body: some View {
        Picker("Select Display", selection: $displayOption) {
            Text("Details").tag("Details")
            Text("Examples").tag("Examples")
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.horizontal, 40)
    }
    
}

struct VocabExampleView: View {
    @State private var example: String = "Example 1"
    let options = ["Example 1", "Example 2", "Example 3", "Example 4"]
    
    var body: some View {
        VStack (spacing: 10) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (alignment: .center, spacing: 0) {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            example = option
                        }) {
                            VStack (spacing: 5) {
                                Text(option)
                                    .padding(.horizontal, 10)
                                    .foregroundColor(example == option ? Color("primary-blue") : .primary)
                                    .font(.system(size: 14))
                                    .padding(0)
                                Rectangle()
                                    .fill(example == option ? Color("primary-blue") : Color("light-grey"))
                                    .frame(height: 1)
                            }
                        }
                        .padding(.horizontal, 0)
                    }
                }
            }.padding(.bottom, 10)
            HStack (alignment: .top) {
                Image("SoundIcon")
                Text("3回ぐらい台湾に行ったことあるけど、何回行っても飽きんし毎回また戻って来たいって思うんよな。")
                    .font(.system(size: 17))
            }
            Text("Recently, I've been so busy with work that I haven't been able to drink at all, so let's grab a drink around Kawaramachi after work today.")
                .font(.system(size: 14))
        }
    }
}

#Preview {
    IndividualVocabView()
}

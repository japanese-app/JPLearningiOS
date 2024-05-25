//
//  BrowseDetailView.swift
//  JPLearningiOS
//
//  Created by Numasawa, Moe on 2024-05-20.
//

import SwiftUI

struct VocabDetailView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack (spacing: 0) {
            Rectangle()
                .fill(Color("light-grey"))
                .frame(height: 1)
            
            ScrollView (showsIndicators: false) {
                VStack(spacing: 25) {
                    VocabMeaningView()
                    VocabSpeechPicker()
                    VocabExampleView()
                    VocabContextView()
                    VocabLearningView()
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
                    // Action for the additional icon
                }) {
                    Image("SettingsIcon")
                        .padding(.trailing, 15)
                }
            }
        }
    }
}

struct VocabMenuBar: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color("light-grey"))
                .frame(height: 1)
            HStack(alignment: .center, spacing: 15) {
                Image("FavoriteIcon")
                    .frame(width: 34, height: 34)
                Text("Review")
                    .font(.system(size: 14))
                    .padding(.vertical, 6)
                    .padding(.horizontal, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color("icon-primary"))
                    )
                Text("Furigana")
                    .font(.system(size: 14))
                    .padding(.vertical, 6)
                    .padding(.horizontal, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color("icon-primary"))
                    )
                Image("NoteIcon")
                    .frame(width: 34, height: 34)
                HStack {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 18))
                        .fontWeight(.light)
                    Image(systemName: "arrow.right")
                        .font(.system(size: 18))
                        .fontWeight(.light)
                }
            }.frame(height: 55)
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
                .padding(.vertical, 15)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color("light-grey"))
        }
    }
}

struct VocabSpeechPicker: View {
    @State private var selection: String = "Casual"
    
    var body: some View {
        Picker("Select Speech Style", selection: $selection) {
            Text("Casual").tag("Casual")
            Text("Formal").tag("Formal")
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
                Text("最近仕事が忙しくて全然飲めてないから、今日仕事が終わった後、河原町あたりで飲も。")
                    .font(.system(size: 17))
            }
            Text("Recently, I've been so busy with work that I haven't been able to drink at all, so let's grab a drink around Kawaramachi after work today.")
                .font(.system(size: 14))
        }
    }
}

struct VocabContextView: View {
    var body: some View {
        VStack (spacing: 8) {
            HStack {
                Text("CONTEXT")
                    .foregroundColor(Color("primary-blue"))
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                Rectangle()
                    .fill(Color("primary-blue"))
                    .frame(height: 0.8)
            }
            Text("Lately, your work schedule has been incredibly demanding, leaving little room for leisure. Realizing it's been ages since you last caught up with your friend over a beer, you're craving that downtime and connection outside of work. So, you propose meeting up after work for a drink, maybe at a cozy spot around Kawaramachi.")
                .font(.system(size: 14))
        }
    }
}

struct VocabLearningView: View {
    var body: some View {
        VStack (spacing: 8) {
            HStack {
                Text("LEARNING")
                    .foregroundColor(Color("primary-blue"))
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                Rectangle()
                    .fill(Color("primary-blue"))
                    .frame(height: 0.8)
            }
            Text("Lately, your work schedule has been incredibly demanding, leaving little room for leisure. Realizing it's been ages since you last caught up with your friend over a beer, you're craving that downtime and connection outside of work. So, you propose meeting up after work for a drink, maybe at a cozy spot around Kawaramachi.")
                .font(.system(size: 14))
        }
    }
}

#Preview {
    VocabDetailView()
}

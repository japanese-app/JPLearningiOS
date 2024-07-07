//
//  IndividualVocabDetailsView.swift
//  JPLearningiOS
//
//  Created by Numasawa, Moe on 2024-06-11.
//

import SwiftUI

struct IndividualVocabDetailsView: View {
    var body: some View {
        VStack (spacing: 15) {
            DetailStructureView()
            DetailOtherStructureView()
            DetailLevelView()
            ExampleNoteView()
            DetailRelatedVerbView()
        }
    }
}

struct DetailStructureView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text("Structure")
                .font(.system(size: 14))
                .fontWeight(.bold)
                .foregroundColor(Color("primary-blue"))
            ZStack (alignment: .leading) {
                Color("background-grey")
                Text("Verb [た] + ことがある")
                .font(.system(size: 14))
                .padding(10)
            }
            .cornerRadius(5)
            .fixedSize(horizontal: false, vertical: true)
        }
    }
}

struct ExampleItem: Hashable {
    let id = UUID()
    var japanese: String
    var english: String
}

struct AccordionItem: Identifiable {
    let id = UUID()
    let title: String
    let examples: Array<ExampleItem>
    var isExpanded: Bool = false
}

struct DetailOtherStructureView: View {
    var example1: ExampleItem
    var example2: ExampleItem
    @State private var items: [AccordionItem]

    init() {
        let example1 = ExampleItem(japanese: "大谷翔平は間違いなく日本の宝", english: "Shohei Ohtani is undoubtedly a national treasure of Japan.")
        let example2 = ExampleItem(japanese: "このプロジェクトは間違いなく成功するだろう", english: "This project will definitely succeed.")
        self.example1 = example1
        self.example2 = example2
        self._items = State(initialValue: [
            AccordionItem(title: "Noun + の + あとで", examples: [example1, example2]),
            AccordionItem(title: "あとで + Phrase", examples: [example1, example2]),
            AccordionItem(title: "Verb + のは + あとで", examples: [example1, example1, example1])
        ])
    }
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text("Other Structures")
                .font(.system(size: 14))
                .fontWeight(.bold)
                .foregroundColor(Color("icon-primary"))
            VStack {
                ForEach($items) { $item in
                    AccordionItemView(item: $item)
                }
            }
        }
    }
}

struct AccordionItemView: View {
    @Binding var item: AccordionItem

    var body: some View {
        VStack {
            HStack {
                Text(item.title)
                    .font(.system(size: 14))
                Spacer()
                Image(systemName: item.isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 10)
            .padding(.top, 10)
            .onTapGesture {
                withAnimation {
                    item.isExpanded.toggle()
                }
            }

            if item.isExpanded {
                VStack (alignment: .leading, spacing: 10) {
                    ForEach(item.examples, id: \.self) { example in
                        ZStack (alignment: .leading) {
                            Color("white")
                            VStack(alignment: .leading, spacing: 5) {
                                Text(example.japanese)
                                    .font(.system(size: 15))
                                Text(example.english)
                                    .font(.system(size: 14))
                            }
                            .padding(8)
                        }
                        .cornerRadius(5)
                        .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .padding(.horizontal, 10)
            }
        }
        .padding(.bottom, 10)
        .background(Color("background-grey"))
        .cornerRadius(5)
    }
}

struct DetailLevelView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text("Level")
                .font(.system(size: 14))
                .fontWeight(.bold)
                .foregroundColor(Color("primary-blue"))
            ZStack (alignment: .leading) {
                Color("background-grey")
                Text("N4")
                .font(.system(size: 14))
                .padding(10)
            }
            .cornerRadius(5)
            .fixedSize(horizontal: false, vertical: true)
        }
    }
}

struct DetailRelatedVerbView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 5) {
            Text("Related Verb Forms")
                .font(.system(size: 14))
                .fontWeight(.bold)
                .foregroundColor(Color("primary-blue"))
            VStack(spacing: 8) {
                ForEach(1...5, id: \.self) { item in
                    DetailRelatedVerbCard()
                }
            }
        }
    }
}

struct DetailRelatedVerbCard: View {
    var body: some View {
        ZStack {
            Color("background-grey")
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
        }
        .cornerRadius(5)
    }
}

#Preview {
    IndividualVocabDetailsView()
}

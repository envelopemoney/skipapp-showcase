// Copyright 2023–2025 Skip
import SwiftUI

enum ToolbarPlaygroundType: String, CaseIterable {
    case hideNavigationBar
    case hideBars
    case hideBarBackgrounds
    case customBarColor
    case visibleCustomBarColor
    case customBarBrush
    case customInlineBarBrush
    case customBarColorScheme
    case customBarColorSchemeBrush
    case `default`
    case updating
    case tint
    case custom
    case label
    case toolbarItem
    case toolbarItemGroup
    case topLeadingItem
    case topLeadingItemGroup
    case topLeadingBackButtonHidden
    case topLeadingTrailingItems
    case principalItem
    case bottom
    case bottomPlain
    case bottomGroup
    case bottomSpaced
    case customToolbarContent
    case toolbarTitleMenu
    case toolbarTitleMenuModifier

    var title: String {
        switch self {
        case .hideNavigationBar:
            return "Hide Navigation Bar"
        case .hideBars:
            return "Hide Bars"
        case .hideBarBackgrounds:
            return "Hide Bar Backgrounds"
        case .customBarColor:
            return "Custom Bar Color"
        case .visibleCustomBarColor:
            return "Always Visible Custom Bar Color"
        case .customBarBrush:
            return "Custom Bar Brush"
        case .customInlineBarBrush:
            return "Custom Inline Bar Brush"
        case .customBarColorScheme:
            return "Custom Color Scheme"
        case .customBarColorSchemeBrush:
            return "Custom Color Scheme Bar Brush"
        case .default:
            return "Default"
        case .updating:
            return "Updating"
        case .tint:
            return "Tint"
        case .custom:
            return "Custom"
        case .label:
            return "Label"
        case .toolbarItem:
            return "ToolbarItem"
        case .toolbarItemGroup:
            return "ToolbarItemGroup"
        case .topLeadingItem:
            return ".topLeading"
        case .topLeadingItemGroup:
            return ".topLeading Group"
        case .topLeadingBackButtonHidden:
            return ".topLeading Back Hidden"
        case .principalItem:
            return ".principal"
        case .topLeadingTrailingItems:
            return "Both Top"
        case .bottom:
            return "Bottom"
        case .bottomPlain:
            return "Bottom Plain List"
        case .bottomGroup:
            return "Bottom 3 Group"
        case .bottomSpaced:
            return "Bottom 3 Spaced"
        case .customToolbarContent:
            return "Custom ToolbarContent"
        case .toolbarTitleMenu:
            return "Toolbar Title Menu"
        case .toolbarTitleMenuModifier:
            return ".toolbarTitleMenu"
        }
    }
}

struct ToolbarPlayground: View {
    var body: some View {
        List(ToolbarPlaygroundType.allCases, id: \.self) { type in
            NavigationLink(type.title, value: type)
        }
        .toolbar {
            PlaygroundSourceLink(file: "ToolbarPlayground.swift")
        }
        .navigationDestination(for: ToolbarPlaygroundType.self) {
            switch $0 {
            case .hideNavigationBar:
                #if os(macOS)
                Text("Not supported on macOS")
                #else
                HideToolbarsPlayground()
                    .navigationTitle($0.title)
                    .toolbar(.hidden, for: .navigationBar)
                    .ignoresSafeArea(edges: .top)
                #endif
            case .hideBars:
                #if os(macOS)
                Text("Not supported on macOS")
                #else
                HideToolbarsPlayground()
                    .navigationTitle($0.title)
                    .toolbar(.hidden)
                    .ignoresSafeArea()
                #endif
            case .hideBarBackgrounds:
                #if os(macOS)
                Text("Not supported on macOS")
                #else
                HideToolbarsPlayground()
                    .navigationTitle($0.title)
                    .toolbarBackground(.hidden, for: .navigationBar, .tabBar)
                #endif
            case .customBarColor:
                #if os(macOS)
                Text("Not supported on macOS")
                #else
                HideToolbarsPlayground()
                    .navigationTitle($0.title)
                    .toolbarBackground(.blue, for: .navigationBar, .tabBar)
                #endif
            case .visibleCustomBarColor:
                #if os(macOS)
                Text("Not supported on macOS")
                #else
                HideToolbarsPlayground()
                    .navigationTitle($0.title)
                    .toolbarBackground(.blue, for: .navigationBar, .tabBar)
                    .toolbarBackground(.visible, for: .navigationBar, .tabBar)
                #endif
            case .customBarBrush:
                #if os(macOS)
                Text("Not supported on macOS")
                #else
                HideToolbarsPlayground()
                    .navigationTitle($0.title)
                    .toolbarBackground(.blue.gradient, for: .navigationBar, .tabBar)
                #endif
            case .customInlineBarBrush:
                #if os(macOS)
                Text("Not supported on macOS")
                #else
                HideToolbarsPlayground()
                    .navigationTitle($0.title)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbarBackground(.blue.gradient, for: .navigationBar, .tabBar)
                #endif
            case .customBarColorScheme:
                #if os(macOS)
                Text("Not supported on macOS")
                #else
                HideToolbarsPlayground()
                    .navigationTitle($0.title)
                    .toolbarColorScheme(.dark, for: .navigationBar, .tabBar)
                #endif
            case .customBarColorSchemeBrush:
                #if os(macOS)
                Text("Not supported on macOS")
                #else
                HideToolbarsPlayground()
                    .navigationTitle($0.title)
                    .toolbarColorScheme(.dark, for: .navigationBar, .tabBar)
                    .toolbarBackground(.blue.gradient, for: .navigationBar, .tabBar)
                #endif
            case .default:
                DefaultToolbarItemPlayground()
                    .navigationTitle($0.title)
            case .updating:
                UpdatingToolbarItemPlayground()
                    .navigationTitle($0.title)
            case .tint:
                TintToolbarItemGroupPlayground()
                    .navigationTitle($0.title)
            case .custom:
                CustomToolbarItemPlayground()
                    .navigationTitle($0.title)
            case .label:
                LabelToolbarItemPlayground()
                    .navigationTitle($0.title)
            case .toolbarItem:
                ToolbarItemPlayground(placement: ToolbarItemPlacement.automatic, placement2: ToolbarItemPlacement.automatic)
                    .navigationTitle($0.title)
            case .toolbarItemGroup:
                ToolbarItemGroupPlayground(placement: ToolbarItemPlacement.automatic)
                    .navigationTitle($0.title)
            case .topLeadingItem:
                #if os(macOS) // ToolbarItemPlacement.topBarLeading unavailable on macOS
                #else
                ToolbarItemPlayground(placement: ToolbarItemPlacement.topBarLeading)
                    .navigationTitle($0.title)
                #endif
            case .topLeadingItemGroup:
                #if os(macOS) // ToolbarItemPlacement.topBarLeading unavailable on macOS
                #else
                ToolbarItemGroupPlayground(placement: ToolbarItemPlacement.topBarLeading)
                    .navigationTitle($0.title)
                #endif
            case .topLeadingBackButtonHidden:
                #if os(macOS) // ToolbarItemPlacement.topBarLeading unavailable on macOS
                #else
                ToolbarBackButtonHiddenPlayground()
                    .navigationTitle($0.title)
                #endif
            case .topLeadingTrailingItems:
                #if os(macOS) // ToolbarItemPlacement.topBarLeading unavailable on macOS
                #else
                ToolbarItemPlayground(placement: ToolbarItemPlacement.topBarLeading, placement2: ToolbarItemPlacement.topBarTrailing)
                    .navigationTitle($0.title)
                #endif
            case .principalItem:
                ToolbarItemPrincipalPlayground()
                    .navigationTitle($0.title)
            case .bottom:
                #if os(macOS) // ToolbarItemPlacement.bottomBar unavailable on macOS
                #else
                ToolbarItemPlayground(placement: ToolbarItemPlacement.bottomBar, placement2: ToolbarItemPlacement.bottomBar)
                    .navigationTitle($0.title)
                #endif
            case .bottomPlain:
                #if os(macOS) // ToolbarItemPlacement.bottomBar unavailable on macOS
                #else
                ToolbarItemPlainStylePlayground(placement: ToolbarItemPlacement.bottomBar, placement2: ToolbarItemPlacement.bottomBar)
                    .navigationTitle($0.title)
                #endif
            case .bottomGroup:
                #if os(macOS) // ToolbarItemPlacement.bottomBar unavailable on macOS
                #else
                ToolbarBottomThreePlayground(spaced: false)
                    .navigationTitle($0.title)
                #endif
            case .bottomSpaced:
                #if os(macOS) // ToolbarItemPlacement.bottomBar unavailable on macOS
                #else
                ToolbarBottomThreePlayground(spaced: true)
                    .navigationTitle($0.title)
                #endif
            case .customToolbarContent:
                #if os(macOS) // ToolbarItemPlacement.topBarLeading unavailable on macOS
                #else
                ToolbarCustomContentPlayground()
                    .navigationTitle($0.title)
                #endif
            case .toolbarTitleMenu:
                ToolbarTitleMenuPlayground()
                    .navigationTitle($0.title)
            case .toolbarTitleMenuModifier:
                ToolbarTitleMenuModifierPlayground()
                    .navigationTitle($0.title)
            }
        }
    }
}

struct HideToolbarsPlayground: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        List {
            Button("Dismiss") {
                dismiss()
            }
            ForEach(1..<50) { i in
                Text("Row \(i)")
            }
        }
    }
}

struct DefaultToolbarItemPlayground: View {
    @Environment(\.dismiss) var dismiss
    @State var firstTapCount = 0
    @State var secondTapCount = 0

    var body: some View {
        List {
            Button("Pop") {
                dismiss()
            }
            ForEach(0..<100) { i in
                Text("Content \(i)")
            }
        }
        .toolbar {
            Button("First: \(firstTapCount)") {
                firstTapCount += 1
            }
            Button("Second: \(secondTapCount)") {
                secondTapCount += 1
            }
        }
    }
}

struct UpdatingToolbarItemPlayground: View {
    @Environment(\.dismiss) var dismiss
    @State var tapCount = 0

    var body: some View {
        List {
            Button("Pop") {
                dismiss()
            }
            ForEach(0..<100) { i in
                Text("Content \(i)")
            }
        }
        .toolbar {
            Button("Inc") {
                tapCount += 1
            }
        }
        .navigationTitle("Tap Count: \(tapCount)")
        .toolbar {
            if tapCount % 2 == 0 {
                Button("Even") {
                    tapCount += 1
                }
            }
        }
    }
}

struct CustomToolbarItemPlayground: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        List {
            Button("Pop") {
                dismiss()
            }
            ForEach(0..<100) { i in
                Text("Content \(i)")
            }
        }
        .toolbar {
            Ellipse()
                .fill(.red.gradient)
                .frame(width: 100, height: 50)
                .onTapGesture {
                    dismiss()
                }
        }
    }
}

struct LabelToolbarItemPlayground: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        List {
            Button("Pop") {
                dismiss()
            }
            ForEach(0..<100) { i in
                Text("Content \(i)")
            }
        }
        .toolbar {
            Button(action: { dismiss() }) {
                Label("Dismiss", systemImage: "trash")
            }
        }
    }
}

struct TintToolbarItemGroupPlayground: View {
    @Environment(\.dismiss) var dismiss
    @State var firstTapCount = 0
    @State var secondTapCount = 0

    var body: some View {
        List {
            Button("Pop") {
                dismiss()
            }
            ForEach(0..<100) { i in
                Text("Content \(i)")
            }
        }
        .toolbar {
            ToolbarItemGroup {
                Button("First: \(firstTapCount)") {
                    firstTapCount += 1
                }
                .tint(.red)
                Button("Second: \(secondTapCount)") {
                    secondTapCount += 1
                }
                .tint(.green)
            }
        }
    }
}

struct ToolbarItemPlayground: View {
    @Environment(\.dismiss) var dismiss
    @State var firstTapCount = 0
    @State var secondTapCount = 0
    let placement: ToolbarItemPlacement
    var placement2: ToolbarItemPlacement? = nil

    var body: some View {
        List {
            Button("Pop") {
                dismiss()
            }
            ForEach(0..<100) { i in
                Text("Content \(i)")
            }
        }
        .toolbar {
            ToolbarItem(placement: placement) {
                Button("First: \(firstTapCount)") {
                    firstTapCount += 1
                }
            }
            if let placement2 {
                ToolbarItem(placement: placement2) {
                    Button("Second: \(secondTapCount)") {
                        secondTapCount += 1
                    }
                }
            }
        }
    }
}

struct ToolbarItemPlainStylePlayground: View {
    @Environment(\.dismiss) var dismiss
    @State var firstTapCount = 0
    @State var secondTapCount = 0
    let placement: ToolbarItemPlacement
    var placement2: ToolbarItemPlacement? = nil

    var body: some View {
        List {
            Button("Pop") {
                dismiss()
            }
            ForEach(0..<100) { i in
                Text("Content \(i)")
            }
        }
        .listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: placement) {
                Button("First: \(firstTapCount)") {
                    firstTapCount += 1
                }
            }
            if let placement2 {
                ToolbarItem(placement: placement2) {
                    Button("Second: \(secondTapCount)") {
                        secondTapCount += 1
                    }
                }
            }
        }
    }
}

struct ToolbarItemGroupPlayground: View {
    @Environment(\.dismiss) var dismiss
    @State var firstTapCount = 0
    @State var secondTapCount = 0
    let placement: ToolbarItemPlacement

    var body: some View {
        List {
            Button("Pop") {
                dismiss()
            }
            ForEach(0..<100) { i in
                Text("Content \(i)")
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: placement) {
                Button("First: \(firstTapCount)") {
                    firstTapCount += 1
                }
                Button("Second: \(secondTapCount)") {
                    secondTapCount += 1
                }
            }
        }
    }
}

struct ToolbarItemPrincipalPlayground: View {
    @Environment(\.dismiss) var dismiss
    @State var tapCount = 0

    var body: some View {
        List {
            Button("Pop") {
                dismiss()
            }
            ForEach(0..<100) { i in
                Text("Content \(i)")
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Principal: \(tapCount)")
                    .bold()
                    .onTapGesture { tapCount += 1 }
            }
        }
        .toolbar {
            Button(action: { dismiss() }) {
                Label("Dismiss", systemImage: "trash")
            }
        }
    }
}

struct ToolbarBottomThreePlayground: View {
    @Environment(\.dismiss) var dismiss
    @State var firstTapCount = 0
    @State var secondTapCount = 0
    @State var thirdTapCount = 0
    let spaced: Bool

    var body: some View {
        List {
            Button("Pop") {
                dismiss()
            }
            ForEach(0..<100) { i in
                Text("Content \(i)")
            }
        }
        .toolbar {
            #if os(macOS) // ToolbarItemPlacement.bottomBar unavailable on macOS
            #else
            ToolbarItemGroup(placement: .bottomBar) {
                Button("First: \(firstTapCount)") {
                    firstTapCount += 1
                }
                if spaced {
                    Spacer()
                }
                Button("Second: \(secondTapCount)") {
                    secondTapCount += 1
                }
                if spaced {
                    Spacer()
                }
                Button("Third: \(thirdTapCount)") {
                    thirdTapCount += 1
                }
            }
            #endif
        }
    }
}

struct ToolbarBackButtonHiddenPlayground: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        List {
            ForEach(0..<100) { i in
                Text("Content \(i)")
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            #if os(macOS) // ToolbarItemPlacement.topBarLeading unavailable on macOS
            #else
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            #endif
        }
    }
}

#if os(macOS)
#else
struct ToolbarCustomContentPlayground: View {
    var body: some View {
        List {
            ForEach(0..<100) { i in
                Text("Content \(i)")
            }
        }
        .toolbar {
            ToolbarCustomContentItem()
        }
    }
}

struct ToolbarCustomContentItem: ToolbarContent {
    @Environment(\.dismiss) var dismiss

    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button("Cancel", role: .cancel, action: { dismiss() })
        }
    }
}
#endif

struct ToolbarTitleMenuPlayground: View {
    @State var selection = 0

    var body: some View {
        List(0..<100) { index in
            if index == 0 {
                Text("Selection: \(selection)")
            } else {
                Text("Row \(index)")
            }
        }
        .toolbarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarTitleMenu {
                Button("Option 1") { selection = 1 }
                Button("Option 2") { selection = 2 }
                Button("Option 3") { selection = 3 }
            }
        }
    }
}

struct ToolbarTitleMenuModifierPlayground: View {
    @State var selection = 0

    var body: some View {
        List(0..<100) { index in
            if index == 0 {
                Text("Selection: \(selection)")
            } else {
                Text("Row \(index)")
            }
        }
        .toolbarTitleDisplayMode(.inline)
        .toolbarTitleMenu {
            Button("Option 1") { selection = 1 }
            Button("Option 2") { selection = 2 }
            Button("Option 3") { selection = 3 }
        }
    }
}

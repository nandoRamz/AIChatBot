//
//  CreateNewAvatarScreen.swift
//  AIChatBot
//
//  Created by Nando on 8/20/25.
//

import SwiftUI

struct CreateNewAvatarScreen: View {
    @State private var avatarName: String = ""
    @State private var selectedAvatarType: AvatarType = .man
    @State private var selectedAvatarAction: AvatarAction = .fighting
    @State private var selectedAvatarLocation: AvatarLocation = .desert
    @State private var generatedImageUrl: String?
    @State private var isGeneratingImage: Bool = false
    @State private var isSavingAvatar: Bool = false
    
    private var saveDisabled: Bool {
        avatarName.isEmpty || generatedImageUrl == nil
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                avatarNameSection
                avatarCharacteristicsSection
                avatarImageGenerationSection
                saveButton
            }
        }
        .navigationTitle("Create Avatar")
    }
}

// MARK: - Views
/// Views
extension CreateNewAvatarScreen {
    private var avatarNameSection: some View {
        TextField("Monkey D Luffy", text: $avatarName)
            .singleFormRowStyle()
            .listFormSectionStyle(title: "Name Your Avatar")
            .padding(.horizontal)
    }
    
    private var avatarCharacteristicsSection: some View {
        VStack(spacing: 0) {
            FormPickerViewBuilder(
                title: "Type",
                selectedItem: $selectedAvatarType,
                items: AvatarType.allCases
            )
            
            FormPickerViewBuilder(
                title: "Action",
                selectedItem: $selectedAvatarAction,
                items: AvatarAction.allCases
            )
            
            FormPickerViewBuilder(
                title: "Location",
                selectedItem: $selectedAvatarLocation,
                items: AvatarLocation.allCases,
                isShowingDivider: false
            )
        }
        .background(.ultraThinMaterial)
        .clipShape(.rect(cornerRadius: 15))
        .listFormSectionStyle(title: "Avatar Characteristics")
        .padding(.horizontal)
    }
    
    private var avatarDescriptionSection: some View {
        Text(DBAvatarModel.mock.characterDescription)
            .foregroundStyle(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .singleFormRowStyle()
            .listFormSectionStyle(title: "Character Description")
            .padding(.horizontal)
    }
    
    private var avatarImageGenerationSection: some View {
        VStack(spacing: 8) {
            avatarImage
            generateImageButton
        }
    }
    
    private var avatarImage: some View {
        ZStack {
            Circle()
                .fill(.ultraThinMaterial)
            
            if let generatedImageUrl {
                ImageLoaderViewBuilder(urlString: generatedImageUrl)
            }
            
            if isGeneratingImage {
                ProgressView()
            }
        }
        .frame(width: 150, height: 150)
        .clipShape(.circle)
    }
    
    private var generateImageButton: some View {
        Button {
            onGenerateImagePress()
        } label: {
            Text(generatedImageUrl == nil ? "Generate Image" : "Regenerate New Image")
                .opacity(isGeneratingImage ? 0 : 1)
        }
    }
    
    private var saveButton: some View {
        PrimaryButton(
            title: "Save",
            isPerformingTask: isSavingAvatar,
            action: { onSavePress() }
        )
        .padding(.horizontal)
        .disabled(saveDisabled)
        .opacity(saveDisabled ? 0.5 : 1)
    }
}

// MARK: - Actions
/// Actions
extension CreateNewAvatarScreen {
    private func onGenerateImagePress() {
        if isGeneratingImage { return }
        isGeneratingImage = true
        generatedImageUrl = nil
        
        Task {
            try? await Task.sleep(for: .seconds(1))
            generatedImageUrl = Constants.randomImageUrl
            isGeneratingImage = false
        }
    }
    
    private func onSavePress() {
        // Add save here
        if isSavingAvatar { return }
        isSavingAvatar = true
        
        Task {
            try? await Task.sleep(for: .seconds(1))
            isSavingAvatar = false
        }
    }
}

#Preview {
    NavigationStack {
        CreateNewAvatarScreen()
    }
}

//
//  ChatInterfaceView.swift
//  RunAnywhereAI
//
//  Simplified chat interface
//

import SwiftUI
import RunAnywhereSDK

struct ChatInterfaceView: View {
    @StateObject private var viewModel = ChatViewModel()
    @StateObject private var conversationStore = ConversationStore.shared
    @State private var showingConversationList = false
    @State private var showingModelSelection = false
    @FocusState private var isTextFieldFocused: Bool

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Chat messages
                ScrollViewReader { proxy in
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(viewModel.messages) { message in
                                VStack(spacing: 8) {
                                    MessageBubbleView(message: message)
                                        .id(message.id)

                                }
                            }

                            if viewModel.isGenerating {
                                HStack {
                                    ProgressView()
                                        .scaleEffect(0.8)
                                    Text("Generating...")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                .padding()
                                .id("typing")
                            }
                        }
                        .padding()
                    }
                    .background(Color(.systemGroupedBackground))
                    .onTapGesture {
                        isTextFieldFocused = false
                    }
                    .onChange(of: viewModel.messages.count) { _, _ in
                        withAnimation {
                            if let lastMessage = viewModel.messages.last {
                                proxy.scrollTo(lastMessage.id, anchor: .bottom)
                            }
                        }
                    }
                }

                // Input area
                inputArea
            }
            .navigationTitle(viewModel.isModelLoaded ? (viewModel.loadedModelName ?? "Chat") : "Chat")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { showingConversationList = true }) {
                        Image(systemName: "list.bullet")
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 8) {
                        Button(action: { showingModelSelection = true }) {
                            HStack(spacing: 4) {
                                Image(systemName: "cube")
                                if viewModel.isModelLoaded {
                                    Text("Switch")
                                        .font(.caption)
                                } else {
                                    Text("Select")
                                        .font(.caption)
                                }
                            }
                        }

                        Button(action: { viewModel.clearChat() }) {
                            Image(systemName: "trash")
                        }
                        .disabled(viewModel.messages.isEmpty)
                    }
                }
            }
            .sheet(isPresented: $showingConversationList) {
                ConversationListView()
            }
            .sheet(isPresented: $showingModelSelection) {
                ModelSelectionSheet { model in
                    await handleModelSelected(model)
                }
            }
            .onAppear {
                setupInitialState()
            }
            .onReceive(NotificationCenter.default.publisher(for: Notification.Name("ModelLoaded"))) { _ in
                Task {
                    await viewModel.checkModelStatus()
                }
            }
        }
    }

    private var inputArea: some View {
        VStack(spacing: 0) {
            Divider()

            // Show model selection prompt if no model is loaded
            if !viewModel.isModelLoaded {
                VStack(spacing: 8) {
                    Text("Welcome! Select and download a model to start chatting.")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)

                    Button("Select Model") {
                        showingModelSelection = true
                    }
                    .font(.caption)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.small)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color.blue.opacity(0.1))

                Divider()
            }

            HStack(spacing: 12) {
                TextField("Type a message...", text: $viewModel.currentInput, axis: .vertical)
                    .textFieldStyle(.plain)
                    .lineLimit(1...4)
                    .focused($isTextFieldFocused)
                    .onSubmit {
                        sendMessage()
                    }
                    .disabled(!viewModel.isModelLoaded)

                Button(action: sendMessage) {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.system(size: 28))
                        .foregroundColor(viewModel.canSend ? .accentColor : .gray)
                }
                .disabled(!viewModel.canSend)
            }
            .padding()
            .background(Color(.systemBackground))
        }
    }

    private func sendMessage() {
        guard viewModel.canSend else { return }

        Task {
            await viewModel.sendMessage()
        }
    }

    private func setupInitialState() {
        Task {
            await viewModel.checkModelStatus()
        }
    }

    private func handleModelSelected(_ model: ModelInfo) async {
        // The model loading is already handled in the ModelSelectionSheet
        // Just update our view model to reflect the change
        await viewModel.checkModelStatus()
    }

}

// Simple message bubble view
struct MessageBubbleView: View {
    let message: ChatMessage

    var body: some View {
        HStack {
            if message.role == .user {
                Spacer(minLength: 60)
            }

            VStack(alignment: message.role == .user ? .trailing : .leading, spacing: 4) {
                Text(message.content)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(message.role == .user ? Color.accentColor : Color(.systemGray5))
                    .foregroundColor(message.role == .user ? .white : .primary)
                    .cornerRadius(16)

                Text(message.timestamp, style: .time)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }

            if message.role != .user {
                Spacer(minLength: 60)
            }
        }
    }
}

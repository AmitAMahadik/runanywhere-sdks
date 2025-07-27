# RunAnywhereAI iOS Sample App

A comprehensive iOS example app showcasing advanced on-device AI capabilities with multiple LLM frameworks, benchmarking tools, and performance optimization features.

## Features

### 🤖 Multi-Framework Support
Integrates 10+ LLM frameworks including:
- **llama.cpp** (GGUF models)
- **Core ML** (Apple's native ML framework)
- **MLX** (Apple Silicon optimized)
- **ONNX Runtime** (Cross-platform inference)
- **TensorFlow Lite** (Mobile-optimized ML)
- **ExecuTorch** (PyTorch mobile runtime)
- **MLC LLM** (Machine Learning Compilation)
- **Swift Transformers** (Native Swift implementation)
- **PicoLLM** (Lightweight inference engine)
- **Foundation Models** (System-level APIs)
- **Mock service** for testing and development

### 💬 Advanced Chat Interface
- **Enhanced Chat View**: Full-featured chat UI with streaming responses
- **Chat Interface View**: Specialized chat components
- **Message Management**: Support for enhanced chat messages with metadata
- **Conversation Export**: Export chat histories
- **Conversation Store**: Persistent chat storage

### 📊 Performance & Benchmarking
- **Comprehensive Benchmarking Suite**: Multi-framework performance testing
- **Real-time Performance Monitoring**: Live metrics during inference
- **Memory Profiling**: Track memory usage and optimization
- **Performance Dashboard**: Visual charts and analytics
- **A/B Testing Framework**: Compare different configurations
- **Benchmark Service**: Automated performance testing

### 🔧 Model Management & Conversion
- **Model Repository**: Centralized model storage and management
- **Model Compatibility Checker**: Validate model-framework compatibility
- **Model Conversion Wizard**: Convert between different model formats
- **Model Format Detection**: Automatic format identification
- **Model Quantization**: Optimize models for mobile deployment
- **Model Import/Download**: Easy model acquisition and management
- **Bundled Models Service**: Pre-packaged model management

### 🚀 Framework Exploration
- **Framework Capability Explorer**: Interactive framework comparison
- **Model Compatibility Matrix**: Visual compatibility overview
- **Framework Configurations**: Optimized settings per framework
- **Dependency Container**: Modular service architecture

### ⚙️ Advanced Configuration
- **Settings View**: Comprehensive configuration options
- **Generation Options**: Fine-tune inference parameters
- **Memory Management**: Intelligent memory allocation
- **Service Lifecycle Management**: Proper resource handling
- **Logging System**: Comprehensive debug and performance logging

## Project Structure

```
RunAnywhereAI/
├── Models/
│   ├── ChatMessage.swift
│   ├── ChatMessageEnhanced.swift
│   ├── GenerationOptions.swift
│   └── ModelInfo.swift
├── Services/
│   ├── LLMService/
│   │   ├── BaseLLMService.swift
│   │   ├── CoreMLService.swift
│   │   ├── FoundationModelsService.swift
│   │   ├── FrameworkInfo.swift
│   │   ├── LLMCapabilities.swift
│   │   ├── LLMInference.swift
│   │   ├── LLMMetrics.swift
│   │   ├── LLMModelLoader.swift
│   │   ├── LLMProtocol.swift
│   │   ├── LlamaCppService.swift
│   │   ├── MLXService.swift
│   │   └── MockLLMService.swift
│   ├── Benchmarking/
│   │   └── BenchmarkSuite.swift
│   ├── Configuration/
│   │   ├── ConfigurationFactory.swift
│   │   └── FrameworkConfigurations.swift
│   ├── Logging/
│   │   ├── LLMService+Logging.swift
│   │   └── Logger.swift
│   ├── ModelManagement/
│   │   ├── ModelCompatibilityMatrix.swift
│   │   ├── ModelConverter.swift
│   │   ├── ModelFormatDetector.swift
│   │   └── ModelRepository.swift
│   ├── Monitoring/
│   │   └── RealtimePerformanceMonitor.swift
│   ├── Profiling/
│   │   └── MemoryProfiler.swift
│   ├── Testing/
│   │   └── ABTestingFramework.swift
│   ├── Tokenization/
│   │   └── Tokenizer.swift
│   ├── BenchmarkService.swift
│   ├── BundledModelsService.swift
│   ├── ConversationExporter.swift
│   ├── ConversationStore.swift
│   ├── DependencyContainer.swift
│   ├── ExecuTorchService.swift
│   ├── FrameworkConfiguration.swift
│   ├── LLMError+Extended.swift
│   ├── LLMError.swift
│   ├── MLCService.swift
│   ├── MemoryManager.swift
│   ├── ModelCompatibilityChecker.swift
│   ├── ModelLoader.swift
│   ├── ModelManager.swift
│   ├── ONNXService.swift
│   ├── PerformanceMonitor.swift
│   ├── PicoLLMService.swift
│   ├── ServiceLifecycleObserverImpl.swift
│   ├── SwiftTransformersService.swift
│   ├── TFLiteService.swift
│   └── UnifiedLLMService.swift
├── ViewModels/
│   ├── ChatViewModel.swift
│   ├── ChatViewModelEnhanced.swift
│   ├── ComparisonViewModel.swift
│   ├── FrameworkCapabilityExplorerViewModel.swift
│   ├── ModelConversionWizardViewModel.swift
│   ├── ModelListViewModel.swift
│   └── ModelQuantizationViewModel.swift
├── Views/
│   ├── Chat/
│   │   └── ChatInterfaceView.swift
│   ├── Comparison/
│   │   └── ComparisonView.swift
│   ├── Dashboard/
│   │   ├── Charts/
│   │   │   └── DashboardCharts.swift
│   │   └── PerformanceDashboardView.swift
│   ├── FrameworkExplorer/
│   │   └── FrameworkCapabilityExplorerView.swift
│   ├── ModelConversion/
│   │   └── ModelConversionWizardView.swift
│   ├── Quantization/
│   │   └── ModelQuantizationView.swift
│   ├── BenchmarkView.swift
│   ├── ChatView.swift
│   ├── MemoryMonitorView.swift
│   ├── ModelDownloadView.swift
│   ├── ModelImportView.swift
│   ├── ModelListView.swift
│   ├── ModelLoadingView.swift
│   └── SettingsView.swift
├── Utilities/
│   └── Constants.swift
└── ContentView.swift
```

## App Navigation

The app features a tab-based interface with four main sections:

1. **Chat Tab**: Interactive chat interface with streaming responses
2. **Models Tab**: Model management, loading, and framework selection  
3. **Benchmark Tab**: Performance testing and analytics tools
4. **Settings Tab**: Configuration options and advanced settings

## Getting Started

### Prerequisites
- **iOS 15.0+** (iOS 17.0+ recommended for full feature support)
- **Xcode 15.0+** 
- **Swift 5.9+**
- **macOS 12.0+** for development
- **Apple Silicon Mac** recommended for MLX framework testing

### Quick Start
1. Clone the repository and navigate to the iOS example:
   ```bash
   cd examples/ios/RunAnywhereAI/
   ```

2. Open the project in Xcode:
   ```bash
   open RunAnywhereAI.xcodeproj
   ```

3. Build and run the app on simulator or device

4. Explore the app:
   - **Chat Tab**: Start a conversation with the mock LLM service
   - **Models Tab**: Browse available frameworks and models
   - **Benchmark Tab**: Run performance tests and view analytics
   - **Settings Tab**: Configure generation parameters

## Development Setup

### Running Lints
```bash
# From the iOS example directory
./swiftlint.sh
```

### Building from Command Line
```bash
# Build for iOS Simulator
xcodebuild build -scheme RunAnywhereAI -destination 'platform=iOS Simulator,name=iPhone 15'

# Build for device (requires valid provisioning profile)
xcodebuild build -scheme RunAnywhereAI -destination 'generic/platform=iOS'
```

### Testing
```bash
# Run unit tests
xcodebuild test -scheme RunAnywhereAI -destination 'platform=iOS Simulator,name=iPhone 15'
```

## Framework Integration

This app demonstrates integration patterns for multiple LLM frameworks:

### Currently Implemented (Mock Services)
- **MockLLMService**: Development and testing service
- **Foundation Models**: System-level model APIs
- **Service Architecture**: Unified interface for all frameworks

### Integration-Ready Services
Each service includes the interface and architecture for:
- **llama.cpp**: GGUF model support with C++ bridge
- **Core ML**: Apple's native ML framework integration  
- **MLX**: Apple Silicon-optimized framework
- **ONNX Runtime**: Cross-platform model execution
- **TensorFlow Lite**: Mobile-optimized TensorFlow
- **ExecuTorch**: PyTorch mobile runtime
- **MLC LLM**: Machine learning compilation framework
- **Swift Transformers**: Pure Swift transformer implementation
- **PicoLLM**: Lightweight inference engine

### Adding Real Framework Support
To integrate actual frameworks:

1. **Add Dependencies**: Include the framework's Swift Package or library
2. **Update Service**: Replace mock implementation with real calls
3. **Configure Models**: Add model loading and format detection
4. **Test Integration**: Use the benchmark suite to validate performance

## Architecture Highlights

- **Modular Design**: Each framework is isolated in its own service
- **Dependency Injection**: Services are managed through DependencyContainer
- **Performance Monitoring**: Real-time metrics collection and analysis
- **Memory Management**: Intelligent resource allocation and cleanup
- **Error Handling**: Comprehensive error types and recovery strategies
- **Logging**: Structured logging for debugging and performance analysis

## License

This sample code is part of the RunAnywhereAI SDK project.
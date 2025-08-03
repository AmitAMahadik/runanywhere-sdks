import Foundation

/// Model registry protocol
public protocol ModelRegistry {
    /// Discover available models
    /// - Returns: Array of discovered models
    func discoverModels() async -> [ModelInfo]

    /// Register a model
    /// - Parameter model: Model to register
    func registerModel(_ model: ModelInfo)

    /// Get model by ID
    /// - Parameter id: Model identifier
    /// - Returns: Model information if found
    func getModel(by id: String) -> ModelInfo?

    /// Filter models by criteria
    /// - Parameter criteria: Filter criteria
    /// - Returns: Filtered models
    func filterModels(by criteria: ModelCriteria) -> [ModelInfo]

    /// Update model information
    /// - Parameter model: Updated model information
    func updateModel(_ model: ModelInfo)

    /// Remove a model
    /// - Parameter id: Model identifier
    func removeModel(_ id: String)
}

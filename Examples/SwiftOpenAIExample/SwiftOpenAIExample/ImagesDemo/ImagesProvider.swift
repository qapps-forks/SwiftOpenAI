//
//  ImagesProvider.swift
//  SwiftOpenAIExample
//
//  Created by James Rochabrun on 10/23/23.
//

import SwiftUI
import SwiftOpenAI

@Observable class ImagesProvider {
   
   private let service: OpenAIService
   
   var images: [URL] = []
   
   init(service: OpenAIService) {
      self.service = service
   }
   
   func createImages(
      parameters: ImageCreateParameters) 
      async throws
   {
      let urls = try await service.legacyCreateImages(
         parameters: parameters).data.map(\.url)
      self.images = urls.compactMap { $0 }
   }
   
   func editImages(
      parameters: ImageEditParameters)
      async throws
   {
      let urls = try await service.legacyEditImage(
         parameters: parameters).data.map(\.url)
      self.images = urls.compactMap { $0 }
   }
   
   func createImageVariations(
      parameters: ImageVariationParameters)
      async throws
   {
      let urls = try await service.legacyCreateImageVariations(parameters: parameters).data.map(\.url)
      self.images = urls.compactMap { $0 }
   }
}

Pod::Spec.new do |spec|
  spec.name         = "Down"
  spec.summary      = "Blazing fast Markdown rendering in Swift, built upon cmark."
  spec.version      = "0.11.0"
  spec.homepage     = "https://github.com/alex-huma/Down-Huma"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.authors      = { "Alex Chaku (Huma Fork)" => "alexchaku@users.noreply.github.com" }
  spec.source       = { :git => "https://github.com/alex-huma/Down-Huma.git", :tag => "v" + spec.version.to_s }
  
  # Include both Swift and C sources in the main module to avoid module conflicts
  spec.source_files = "Sources/Down/{AST,Enums & Options,Extensions,Renderers}/**/*.swift", "Sources/Down/*", "Sources/cmark/*.{h,c}"
  spec.ios.source_files = "Sources/Down/Views/**"
  spec.osx.source_files = "Sources/Down/Views/**"
  spec.public_header_files = "Sources/Down/*.h", "Sources/cmark/*.h"
  
  spec.ios.deployment_target = "9.0"
  spec.tvos.deployment_target = "9.0"
  spec.osx.deployment_target = "10.11"
  spec.requires_arc = true
  spec.module_name = "Down"
  
  spec.ios.resource = 'Sources/Down/Resources/DownView.bundle'
  spec.osx.resource = 'Sources/Down/Resources/DownView.bundle'
  spec.swift_versions = ['5.0', '5.1']
  
  # Preserve important cmark files
  spec.preserve_paths = "Sources/cmark/include/module.modulemap", "Sources/cmark/*.inc", "Sources/cmark/COPYING"
  
  # Xcode 26 compatibility - unified configuration
  spec.pod_target_xcconfig = {
    'SWIFT_INCLUDE_PATHS' => '$(SRCROOT)/Down/Sources/cmark/**',
    'HEADER_SEARCH_PATHS' => '$(SRCROOT)/Down/Sources/cmark/**',
    'SWIFT_VERSION' => '5.0',
    'MODULEMAP_FILE' => '$(SRCROOT)/Down/Sources/cmark/include/module.modulemap',
    # Enable this if you encounter Xcode 26 "Explicitly Built Modules" issues
    # 'SWIFT_ENABLE_EXPLICITLY_BUILT_MODULES' => 'NO'
  }
end

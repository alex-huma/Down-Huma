Pod::Spec.new do |spec|
  spec.name         = "Down"
  spec.summary      = "Blazing fast Markdown rendering in Swift, built upon cmark."
  spec.version      = "0.11.0"
  spec.homepage     = "https://github.com/alex-huma/Down-Huma"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.authors      = { "Alex Chaku (Huma Fork)" => "alexchaku@users.noreply.github.com" }
  spec.source       = { :git => "https://github.com/alex-huma/Down-Huma.git", :tag => "v" + spec.version.to_s }
  spec.source_files = "Sources/Down/{AST,Enums & Options,Extensions,Renderers}/**/*.swift", "Sources/Down/*"
  spec.ios.source_files = "Sources/Down/Views/**"
  spec.osx.source_files = "Sources/Down/Views/**"
  spec.public_header_files = "Sources/Down/*.h"
  spec.ios.deployment_target = "9.0"
  spec.tvos.deployment_target = "9.0"
  spec.osx.deployment_target = "10.11"
  spec.requires_arc = true
  spec.module_name = "Down"
  spec.ios.resource = 'Sources/Down/Resources/DownView.bundle'
  spec.osx.resource = 'Sources/Down/Resources/DownView.bundle'
  spec.swift_versions = ['5.0', '5.1']
  
  # Xcode 26 compatibility
  spec.pod_target_xcconfig = {
    'SWIFT_INCLUDE_PATHS' => '$(SRCROOT)/Down/Sources/cmark/**',
    'SWIFT_VERSION' => '5.0',
    'HEADER_SEARCH_PATHS' => '$(SRCROOT)/Down/Sources/cmark/**',
    # Uncomment the line below if you encounter issues with Xcode 26 "Explicitly Built Modules"
    # 'SWIFT_ENABLE_EXPLICITLY_BUILT_MODULES' => 'NO'
  }
  
  # Create libcmark subspec for proper module separation (required for Xcode 26)
  spec.subspec 'libcmark' do |libcmark|
    libcmark.source_files = 'Sources/cmark/*.{h,c}'
    libcmark.public_header_files = 'Sources/cmark/*.h'
    libcmark.preserve_paths = 'Sources/cmark/include/module.modulemap', 'Sources/cmark/*.inc', 'Sources/cmark/COPYING'
    libcmark.pod_target_xcconfig = {
      'HEADER_SEARCH_PATHS' => '$(SRCROOT)/Down/Sources/cmark/**',
      'SWIFT_INCLUDE_PATHS' => '$(SRCROOT)/Down/Sources/cmark/**',
      'MODULEMAP_FILE' => '$(SRCROOT)/Down/Sources/cmark/include/module.modulemap'
    }
  end
  
  # Main Down spec now depends on the libcmark subspec
  spec.default_subspecs = 'libcmark'
end

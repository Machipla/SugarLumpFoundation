Pod::Spec.new do |spec|
  spec.name          = 'SugarLumpFoundation'
  spec.homepage      = "https://github.com/Machipla/SugarLumpFoundation"
  spec.version       = '0.0.1'
  spec.platform      = :ios, "9.0"
  spec.authors       = 'Mario Chinchilla'
  spec.summary       = 'The Foundation module of SugarLump pod'
  spec.license       = { :type => "MIT", :file => "LICENSE.md" }
  spec.source        = { :git => 'https://github.com/Machipla/SugarLumpFoundation.git', :tag => "#{spec.version}" }
  spec.swift_version = '4.0'

  spec.source_files = 'Sources/**/*.{swift}'
  spec.frameworks   = 'Foundation'
end
# Uncomment the next line to define a global platform for your project
 platform :ios, '10.0'

workspace 'Viper'
target 'Viper' do
  project 'Viper.project'

  # Pods for Viper
  pod 'Moya'
  target 'ViperTests' do
    inherit! :search_paths
    # Pods for testing
  end
  use_frameworks! :linkage => :dynamic
end

target 'NetworkService' do
  project 'NetworkService/NetworkService.project'
  pod 'Moya'
  
  target 'NetworkServiceTests' do
    inherit! :search_paths
  end
  use_frameworks! :linkage => :dynamic
end

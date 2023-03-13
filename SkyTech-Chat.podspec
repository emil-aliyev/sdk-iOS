
Pod::Spec.new do |s|
  s.name             = 'SkyTech-Chat'
  s.version          = '0.1.13'
  s.summary          = 'A short description of SkyTechChat.'

  s.homepage         = 'https://github.com/emil-aliyev/sdk-iOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'RashadShirizadaW' => 'rashad.shirizada@gmail.com' }
  s.source           = { :git => 'https://github.com/emil-aliyev/sdk-iOS', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'

  s.source_files = 'SkyTechChat/Classes/**/*'
  

  s.frameworks = 'UIKit'
end

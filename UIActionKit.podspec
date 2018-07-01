
Pod::Spec.new do |s|
  s.name             = 'UIActionKit'
  s.version          = '0.1.0'
  s.summary          = 'An elegant way to handle UI action events in Swift.'

  s.description      = <<-DESC
An elegant way to handle UI action events in Swift. Inspired by UI responder chain and chain of responsibility pattern.
                       DESC

  s.homepage         = 'https://github.com/HyanCat/UIActionKit'
  s.license          = { :type => 'Apache', :file => 'LICENSE' }
  s.author           = { 'HyanCat' => 'hyancat@live.cn' }
  s.source           = { :git => 'https://github.com/HyanCat/UIActionKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/HyanCat'

  s.ios.deployment_target = '8.0'
  # s.swift_version = '4.0'

  s.source_files = 'UIActionKit/Classes/**/*'

end

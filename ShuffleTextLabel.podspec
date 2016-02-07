Pod::Spec.new do |s|
  s.name                  = 'ShuffleTextLabel'
  s.version               = '0.0.2'
  s.source                = { :git => 'https://github.com/hoppenichu/ShuffleTextLabel.git', :tag => s.version }

  s.summary               = 'UILabel Shuffle Text Effect'
  s.homepage              = 'https://github.com/hoppenichu/ShuffleTextLabel'
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.author                = { 'Takeru Chuganji' => 'takeru@hoppenichu.com' }

  s.ios.deployment_target = '8.0'
  s.requires_arc          = true
  s.source_files          = 'ShuffleTextLabel/*.swift'
end

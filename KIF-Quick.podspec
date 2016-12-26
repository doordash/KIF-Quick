Pod::Spec.new do |s|
  s.name             = 'KIF-Quick'
  s.version          = '1.1.0'
  s.summary          = 'Enable Behaviour-Driven Integration Tests built on KIF using Quick syntax'
  s.description      = <<-DESC
Write Quick specs to drive KIF actors through user interface actions.
		   * share common setup using spec context
           * report XCTest failure with file name and line number
           * install compatible versions of KIF and Quick
           * supports Swift 3.0, 2.3, 2.2
                       DESC
  s.homepage         = 'https://github.com/doordash/KIF-Quick'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Paul Zabelin' => 'paulz@doordash.com' }
  s.source           = { :git => 'https://github.com/doordash/KIF-Quick.git', :tag => s.version.to_s }
  s.platform     = :ios, '8.0'
  s.source_files = 'KIF-Quick/Classes'
  s.framework = 'XCTest'
  s.dependency 'KIF', '~> 3.0'
  s.dependency 'Quick', '~> 1.0'
end

Pod::Spec.new do |s|
  s.name     = 'NSString+Utils'
  s.version  = '0.1.2'
  s.license  = 'MIT'
  s.summary  = 'NSString (Utils) extends the NSString class to provide additional functionalities.'
  s.homepage = 'https://github.com/valeriomazzeo/NSString-Utils'
  s.authors  = {'Valerio Mazzeo' => 'valerio.mazzeo@gmail.com'}
  s.source   = { :git => 'https://github.com/valeriomazzeo/NSString-Utils.git', :tag => '0.1.2' }
  s.source_files = 'NSString+Utils/Source/NSString+Utils.{h,m}'
  s.requires_arc = true
  s.framework = 'Foundation'
end

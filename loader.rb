libs = [ 'configs', 'controllers', 'models', 'lib' ]
libs.each do |lib|
  Dir.glob(File.expand_path("../#{lib}/*", __FILE__)).each do |file|
    require file
  end
end

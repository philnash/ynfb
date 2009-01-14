# config.ru

ENV['GEM_PATH'] = '~/.gems/' # your local gem home

require 'rubygems'
 
# Uncomment if your app uses bundled gems
gems_dir = File.expand_path(File.join(File.dirname(__FILE__), 'gems'))
Gem.clear_paths
$BUNDLE = true
Gem.path.unshift(gems_dir)
 
require 'merb-core'

class Time
  def to_date
    Date.parse(self.to_formatted_s(:db))
  end
end
 
Merb::Config.setup(:merb_root   => File.expand_path(File.dirname(__FILE__)),
                   :environment => ENV['RACK_ENV'])
Merb.environment = "production" #Merb::Config[:environment]
Merb.root = Merb::Config[:merb_root]
Merb::BootLoader.run
 
run Merb::Rack::Application.new
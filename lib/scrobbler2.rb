%w{cgi rubygems hpricot active_support}.each { |x| require x }

$: << File.expand_path(File.dirname(__FILE__))

require 'scrobbler2/base'
require 'scrobbler2/version'

# 
# require 'scrobbler2/album'
require 'scrobbler2/artist'
# require 'scrobbler2/chart'
require 'scrobbler2/user'
# require 'scrobbler2/tag'
# require 'scrobbler2/track'

# require 'scrobbler2/simpleauth'
# require 'scrobbler2/scrobble'
# require 'scrobbler2/playing'

require 'scrobbler2/rest'

# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{scrobbler}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Nunemaker"]
  s.date = %q{2008-12-03}
  s.description = %q{wrapper for audioscrobbler (last.fm) web services}
  s.email = %q{nunemaker@gmail.com}
  s.extra_rdoc_files = ["lib/scrobbler/album.rb", "lib/scrobbler/artist.rb", "lib/scrobbler/base.rb", "lib/scrobbler/chart.rb", "lib/scrobbler/playing.rb", "lib/scrobbler/rest.rb", "lib/scrobbler/scrobble.rb", "lib/scrobbler/simpleauth.rb", "lib/scrobbler/tag.rb", "lib/scrobbler/track.rb", "lib/scrobbler/user.rb", "lib/scrobbler/version.rb", "lib/scrobbler.rb", "README.txt"]
  s.files = ["examples/album.rb", "examples/artist.rb", "examples/scrobble.rb", "examples/tag.rb", "examples/track.rb", "examples/user.rb", "History.txt", "lib/scrobbler/album.rb", "lib/scrobbler/artist.rb", "lib/scrobbler/base.rb", "lib/scrobbler/chart.rb", "lib/scrobbler/playing.rb", "lib/scrobbler/rest.rb", "lib/scrobbler/scrobble.rb", "lib/scrobbler/simpleauth.rb", "lib/scrobbler/tag.rb", "lib/scrobbler/track.rb", "lib/scrobbler/user.rb", "lib/scrobbler/version.rb", "lib/scrobbler.rb", "Manifest", "MIT-LICENSE", "Rakefile", "README.txt", "scrobbler.gemspec", "setup.rb", "test/fixtures/xml/album/info.xml", "test/fixtures/xml/artist/fans.xml", "test/fixtures/xml/artist/similar.xml", "test/fixtures/xml/artist/topalbums.xml", "test/fixtures/xml/artist/toptags.xml", "test/fixtures/xml/artist/toptracks.xml", "test/fixtures/xml/tag/topalbums.xml", "test/fixtures/xml/tag/topartists.xml", "test/fixtures/xml/tag/toptags.xml", "test/fixtures/xml/tag/toptracks.xml", "test/fixtures/xml/track/fans.xml", "test/fixtures/xml/track/toptags.xml", "test/fixtures/xml/user/friends.xml", "test/fixtures/xml/user/neighbours.xml", "test/fixtures/xml/user/profile.xml", "test/fixtures/xml/user/recentbannedtracks.xml", "test/fixtures/xml/user/recentlovedtracks.xml", "test/fixtures/xml/user/recenttracks.xml", "test/fixtures/xml/user/systemrecs.xml", "test/fixtures/xml/user/topalbums.xml", "test/fixtures/xml/user/topartists.xml", "test/fixtures/xml/user/toptags.xml", "test/fixtures/xml/user/toptracks.xml", "test/fixtures/xml/user/weeklyalbumchart.xml", "test/fixtures/xml/user/weeklyalbumchart_from_1138536002_to_1139140802.xml", "test/fixtures/xml/user/weeklyartistchart.xml", "test/fixtures/xml/user/weeklyartistchart_from_1138536002_to_1139140802.xml", "test/fixtures/xml/user/weeklychartlist.xml", "test/fixtures/xml/user/weeklytrackchart.xml", "test/fixtures/xml/user/weeklytrackchart_from_1138536002_to_1139140802.xml", "test/mocks/rest.rb", "test/test_helper.rb", "test/unit/album_test.rb", "test/unit/artist_test.rb", "test/unit/chart_test.rb", "test/unit/tag_test.rb", "test/unit/track_test.rb", "test/unit/user_test.rb", "website/css/common.css", "website/index.html"]
  s.has_rdoc = true
  s.homepage = %q{http://scrobbler.rubyforge.org}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Scrobbler", "--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{scrobbler}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{wrapper for audioscrobbler (last.fm) web services}
  s.test_files = ["test/test_helper.rb", "test/unit/album_test.rb", "test/unit/artist_test.rb", "test/unit/chart_test.rb", "test/unit/tag_test.rb", "test/unit/track_test.rb", "test/unit/user_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hpricot>, [">= 0.4.86"])
      s.add_runtime_dependency(%q<activesupport>, [">= 1.4.2"])
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<hpricot>, [">= 0.4.86"])
      s.add_dependency(%q<activesupport>, [">= 1.4.2"])
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<hpricot>, [">= 0.4.86"])
    s.add_dependency(%q<activesupport>, [">= 1.4.2"])
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end

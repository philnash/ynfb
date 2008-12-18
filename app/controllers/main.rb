class Main < Application
  provides :js, :html
  require 'scrobbler2'
  def index
    render
  end
  def results
    @user = Scrobbler2::User.new(params[:username])
    @user.library
    @neighbours = @user.neighbours(:limit => 20)
    @all_artists = []
    @neighbours.each do |n|
      @all_artists << n.top_artists(:period => '3month')
    end
    @all_artists.flatten!
    @the_comparer = {}
    urls = {}
    @all_artists.each do |a|
      if @the_comparer.has_key? a.name
        @the_comparer[a.name] += 1
      else
        @the_comparer[a.name] = 1
      end
      urls[a.name] = a.url
    end
    @the_comparer = @the_comparer.sort { |a,b| b[1]<=>a[1] }
    library = @user.library.collect { |a| a.name }
    @the_comparer.each do |k,v|
      unless library.include? k
        @the_band = k
        @count = v
        @the_url = urls[@the_band]
        break
      end
    end
    render
  end
end
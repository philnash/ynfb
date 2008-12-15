class Main < Application
  require 'scrobbler2'
  def index
    render
  end
  def do_it
    @user = Scrobbler2::User.new(params[:username])
    @user.library
    @neighbours = @user.neighbours(:limit => 20)
    @all_artists = []
    @neighbours.each do |n|
      @all_artists << n.top_artists
    end
    @all_artists.flatten!
    @the_comparer = {}
    @all_artists.each do |a|
      if @the_comparer.has_key? a.name
        @the_comparer[a.name] += 1
      else
        @the_comparer[a.name] = 1
      end
    end
    Merb.logger.info(@user.library.to_s)
    @the_comparer = @the_comparer.sort { |a,b| b[1]<=>a[1] }
    library = @user.library.collect { |a| a.name }
    @the_comparer.each do |k,v|
      unless library.include? k
        @the_band = Scrobbler2::Artist.new(k)
        @count = v
        break
      end
    end
    render
  end
end
class Array
  def include_name?(test)
    result = false
    self.each do |i|
      if i.name == name
        result = true
      end
    end
  end
end
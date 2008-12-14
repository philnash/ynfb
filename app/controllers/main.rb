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
        @all_artists << @neighbours.top_artists
      end
    Merb.logger.info("================hello===============")
    @all_artists.flatten!
    @the_comparer = {}
    @all_artists.each do |a|
      if @the_comparer.has_key? a.name
        @the_comparer[a.name] += 1
      else
        @the_comparer[a.name] = 1
      end
    end
    render
  end
  
end

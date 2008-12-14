class Main < Application
  
  require 'scrobbler2'

  # ...and remember, everything returned from an action
  # goes to the client...
  def index
    render
  end
  
  def do_it
    @user = Scrobbler2::User.new(params[:username])
    @user.library
    @neighbours = @user.neighbours(:limit => 20)
    unless @neighbours.any?
      @neighbours.each do |n|
        @neighbours.top_artists
      end
    end
    render
  end
  
end

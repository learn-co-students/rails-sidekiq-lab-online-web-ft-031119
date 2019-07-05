class SongsWorker
  require 'csv'
  include Sidekiq::Worker
 
  def perform(songs_file)
    CSV.foreach(params[:songs].path, headers: true) do |lead|
      Song.create(song: lead[0], artist: lead[1])
    end
  end
end
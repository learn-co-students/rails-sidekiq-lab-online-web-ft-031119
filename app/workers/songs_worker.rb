class SongsWorker
  require 'csv'
  include Sidekiq::Worker

  def perform(songs_file)
    CSV.foreach(songs_file, headers: true) do |f|
      Song.create(title: f[0], artist_name: f[1])
    end
  end

end

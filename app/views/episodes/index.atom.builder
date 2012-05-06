atom_feed language: 'en-US' do |feed|
  feed.title "Hipsterija"
  feed.updated Time.now

  @episodes.each do |episode|
    feed.entry(episode) do |entry|
      entry.url episode.link
      entry.title episode.title
      entry.content(link_to(episode.link), type: 'html')
      # the strftime is needed to work with Google Reader.
      entry.updated(episode.created_at.strftime("%Y-%m-%dT%H:%M:%SZ"))
      entry.author 'Radio študent'
    end
  end
end
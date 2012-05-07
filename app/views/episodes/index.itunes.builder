xml.instruct! :xml, version: "1.0", encoding: "UTF-8"

xml.rss "version" => "2.0",
        "xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd",
        "xmlns:itunesu" => "http://www.itunesu.com/feed" do


  xml.channel do
    xml.title "Hipsterija"
    xml.link "http://hipsterija.herokuapp.com"
    xml.language "sl-si"
    xml.itunes :author, "Radio študent"
    xml.itunes :subtitle, "rubrika petkovega jutranjca"
    xml.itunes :summary, "Ljubljanska hipsterska scena"
    xml.description "Ljubljanska hipsterska scena"
    xml.itunes :explicit, "yes"

    @episodes.each do |episode|
      xml.item do
        xml.title episode.title
        xml.enclosure url: episode.link, type: "audio/mpeg"
        xml.guid episode.id
        xml.pubDate episode.created_at.to_s :rfc822
      end
    end

  end
end

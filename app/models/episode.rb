require 'open-uri'

class Episode < ActiveRecord::Base
  attr_accessible :link, :title

  def self.import
    title, link_without_audio, link_with_audio = nil, nil, nil
    url = "http://radiostudent.si/p/hipsterija/"

    doc = Nokogiri::HTML(open(url))

    doc.css('#content div.entry-content p').each do |element|

      # title
      if ((element.text.present?) and (element.text =~ /Epizoda/i))
        title = element.text.strip
      end

      # audio link
      if (element.children.at_css('object embed').present?)
        link_with_audio = element.children.at_css('object embed').attributes['flashvars'].value.split('soundFile=').last
      end

      # text link
      if ((link_with_audio.nil?) and (element.children.at_css('a').present?))
        link_without_audio = element.children.at_css('a').attributes['href'].value
      end

      link = link_with_audio.present?? link_with_audio : link_without_audio

      if title and link
        Episode.find_or_create_by_title(title: title, link: link)
        link_with_audio, link_without_audio = nil, nil
        link, title = nil, nil
      end
    end
  end
end

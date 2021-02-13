# frozen_string_literal: true

require 'json'
require 'zlib'

class Ch03
  def england(json_path)
    text = ''

    Zlib::GzipReader.open(json_path) do |gz|
      gz.each do |io|
        json = JSON.parse(io, symbolize_names: true)
        text = json[:text] if json[:title] == 'イギリス'
      end
    end
    text
  end

  def categories(json_path)
    content = england(json_path)
    content.scan(/\[\[Category:[^\]]*\]\]/)
  end
end
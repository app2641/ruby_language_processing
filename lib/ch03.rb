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

  def sections(json_path)
    content = england(json_path)
    matches = content.scan(/^=+[^=]*=+$/)
    matches.map do |match|
      section = (match.count('=') / 2) - 1
      section_name = match.gsub(/=/, '')
      "#{section_name}(#{section})"
    end
  end

  def media(json_path)
    content = england(json_path)
    content.scan(/^\[\[ファイル:([^|]*)\|.*\]\]$/).flatten
  end

  def emphasis(json_path)
    content = england(json_path)
    matches = []

    matches << content.scan(/[^']''([^']*)''[^']/)
    matches << content.scan(/[^']'''([^']*)'''[^']/)
    matches << content.scan(/[^']'''''([^']*)'''''[^']/)
    matches.flatten.uniq
  end
end
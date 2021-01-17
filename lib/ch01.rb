# frozen_string_literal: true

class Ch01
  def reverse
    str = 'stressed'
    str.reverse
  end

  def patocar
    str = 'パタトクカシーー'
    str.chars.select.with_index { |s, i| i.even? }.join
  end

  def patatokucassy
    str = 'パトカー'
    str2 = 'タクシー'

    str.chars.zip(str2.chars).join
  end

  def pai
    str = 'Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics.'
    list = str.gsub(/,|\./, '').split(' ')
    list.map(&:length)
  end
end
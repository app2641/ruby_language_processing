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
    list.map(&:size)
  end

  def element_symbol
    single = [1, 5, 6, 7, 8, 9, 15, 16, 19]
    str = 'Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can.'
    list = str.gsub(/\./, '').split(' ')

    list.map.with_index(1) do |l, i|
      el = single.include?(i) ? l.slice(0) : l.slice(0..1)
      [el, i]
    end.to_h.transform_keys(&:to_sym)
  end
end
# frozen_string_literal: true

require 'ch01/ngram'

class Ch01
  def reverse(str)
    str.reverse
  end

  def patocar(str)
    str.chars.select.with_index { |s, i| i.even? }.join
  end

  def patatokucassy(str, str2)
    str.chars.zip(str2.chars).join
  end

  def pai(str)
    list = str.gsub(/,|\./, '').split(' ')
    list.map(&:size)
  end

  def element_symbol(str)
    single = [1, 5, 6, 7, 8, 9, 15, 16, 19]
    list = str.gsub(/\./, '').split(' ')

    list.map.with_index(1) do |l, i|
      el = single.include?(i) ? l.slice(0) : l.slice(0..1)
      [el, i]
    end.to_h.transform_keys(&:to_sym)
  end

  def n_gram_for_terms(str)
    str.split(' ').each_cons(2).map(&:itself)
  end

  def n_gram_for_words(str)
    Ngram.new(str).to_ngram
  end

  def union_set(str, str2)
    (Ngram.new(str).to_ngram | Ngram.new(str2).to_ngram).sort
  end

  def intersection_set(str, str2)
    (Ngram.new(str).to_ngram & Ngram.new(str2).to_ngram).sort
  end

  def difference_set(str, str2)
    (Ngram.new(str).to_ngram - Ngram.new(str2).to_ngram).sort
  end

  def template(str, str2, str3)
    sprintf("%s時の%sは%s", str, str2, str3)
  end

  def cipher(str)
    str.chars.map do |char|
      char.match?(/[a-z]/) ? (219 - char.ord).chr : char
    end.join
  end
end
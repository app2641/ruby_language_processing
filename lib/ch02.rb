# frozen_string_literal: true

require 'tempfile'

class Ch02
  def line_count(file_path)
    File.read(file_path).count("\n")
  end

  def replace_tab_to_space(file_path)
    File.read(file_path).gsub(/\t/, "\s")
  end

  def line_one(file_path)
    text = ''

    File.open(file_path) do |file|
      text = file.gets
    end
    text
  end

  def line_two(file_path)
    text = ''

    File.open(file_path) do |file|
      file.each do |f|
        text = f if file.lineno == 2
      end
    end
    text
  end

  def paste(one, two)
    one_file = Tempfile.open do |file|
      file.tap { |f| f.write(one) }
    end

    two_file = Tempfile.open do |file|
      file.tap { |f| f.write(two) }
    end

    `paste #{one_file.path} #{two_file.path}`
  end

  def head(file_path, line)
    text = []

    File.open(file_path) do |file|
      file.each do |f|
        text << f if file.lineno <= line
      end
    end
    text.join
  end

  def tail(file_path, line)
    text = []
    max_line = File.read(file_path).count("\n")

    File.open(file_path) do |file|
      file.each do |f|
        text << f if file.lineno > (max_line - line)
      end
    end
    text.join
  end

  def beginning_of_line(file_path)
    text = []

    File.open(file_path) do |file|
      file.each do |f|
        text << f.chars.first
      end
    end
    
    text.uniq.sort.join("\n") << "\n"
  end

  def sort_third(file_path)
    text = []

    File.open(file_path) do |file|
      file.each do |value|
        values = value.split("\t")
        text << [values[2], value]
      end
    end

    text.to_h
      .sort { |a, b| b[0].to_i <=> a[0].to_i }
      .first(3)
      .map { |value| value[1] }
      .join
  end

  def count(file_path)
    result = {}

    File.open(file_path) do |file|
      file.each do |value|
        values = value.split("\t")
        result[values[0]] = 0 if result[values[0]].nil?
        result[values[0]] += 1
      end
    end

    result.sort { |a, b| b[1] <=> a[1] }
      .map { |v| " #{v[1]} #{v[0]}" }
      .first(2)
      .join("\n") + "\n"
  end
end
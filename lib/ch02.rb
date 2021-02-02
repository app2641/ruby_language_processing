# frozen_string_literal: true

require 'tempfile'

class Ch02
  def line_count(file_path)
    File.read(file_path).count("\n")
  end

  def sed(file_path)
    `sed -e 's/\t/\s/g' #{file_path}`
  end

  def line_one(file_path)
    `cat #{file_path} | head -n 1`
  end

  def line_two(file_path)
    `cat #{file_path} | head -n 2 | tail -n 1`
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
    `head -n #{line} #{file_path}`
  end

  def tail(file_path, line)
    `tail -n #{line} #{file_path}`
  end

  def beginning_of_line(file_path)
    `cut -b 1 #{file_path} | sort | uniq`
  end

  def sort_therd(file_path)
    `sort -rnk 3 #{file_path} | head -n 3`
  end

  def count(file_path)
    `cut -f 1 #{file_path} | sort | uniq -c | sort -rn | head -n 3`
  end
end
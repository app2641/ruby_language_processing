# frozen_string_literal: true

require 'tempfile'

class Ch02
  def line_count(file_path)
    `wc -l #{file_path}`
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
end
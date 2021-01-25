# frozen_string_literal: true

class Ch02
  def line_count(file_path)
    `wc -l #{file_path}`
  end

  def sed(file_path)
    `sed -e 's/\t/\s/g' #{file_path}`
  end
end
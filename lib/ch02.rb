# frozen_string_literal: true

class Ch02
  def line_count(file_path)
    `wc -l #{file_path}`
  end
end
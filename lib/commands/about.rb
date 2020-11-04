# frozen_string_literal: true

class About < Command
  def description
    'описание программы и ее окружения'
  end

  def call
    path = File.expand_path('../../README.md', __dir__)
    system("cat #{path}")
  end
end

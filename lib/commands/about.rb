# frozen_string_literal: true

class About < Command
  def description
    'описание программы и ее окружения'
  end

  def call
    system('cat README.md')
  end
end

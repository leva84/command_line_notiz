# frozen_string_literal: true

class About < Command
  def description
    'описание программы и ее окружения'
  end

  def call
    system("cat #{CURRENT_PATH} README.md") { |answer| answer.readlines }
  end
end

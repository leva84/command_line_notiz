# frozen_string_literal: true

class Exit < Command
  def description
    'выход из программы'
  end

  def call
    abort
  end
end

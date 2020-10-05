# frozen_string_literal: true

class Help < Command
  def description
    'выводит список доступных команд'
  end

  def call(registry)
    registry.commands_names
  end
end

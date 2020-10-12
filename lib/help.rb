# frozen_string_literal: true

class Help < Command
  def self.description
    'выводит список доступных команд'
  end

  def call
    registry.commands_names
  end
end

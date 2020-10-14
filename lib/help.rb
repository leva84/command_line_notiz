# frozen_string_literal: true

class Help < Command
  def self.description
    'выводит список доступных команд'
  end

  def call
    App.new.registry.commands_names
  end
end

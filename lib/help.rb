# frozen_string_literal: true

class Help < Command
  def description
    'выводит список доступных команд'
  end

  def call
    registry.commands_by_names.each do |command|
      puts "#{command[0]} - #{command[1].description}"
    end
  end
end

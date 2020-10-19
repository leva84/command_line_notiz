# frozen_string_literal: true

class Help < Command
  def description
    'выводит список доступных команд'
  end

  def call
    registry.commands_class_by_names.each do |command|
      puts "#{command[:name]} - #{command[:class_name].description}"
    end
  end
end

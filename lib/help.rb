# frozen_string_literal: true

class Help < Command
  def description
    'выводит список доступных команд'
  end

  def call
    registry.command_description_by_name.each do |command|
      puts "#{command[:name]} - #{command[:description]}"
    end
  end
end

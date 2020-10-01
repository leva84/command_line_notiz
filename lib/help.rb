# frozen_string_literal: true

class Help < Command
  def self.name_command
    'help'
  end

  def description
    'выводит список доступных команд'
  end

  def command_work
    command_list = []
    commands.each do |com, class_com|
      command_list << "#{com} - #{class_com.new.description}\n"
    end
    command_list
  end
end

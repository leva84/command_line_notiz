# frozen_string_literal: true

class Help < Command
  def name_command
    'help'
  end

  def description
    'выводит список доступных команд'
  end

  def result_work
    command_list = []
    self.hash_command.each do |com, class_com|
      command_list << "#{com} - #{class_com.new.description}"
    end
    command_list
  end
end

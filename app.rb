# frozen_string_literal: true

require_relative 'lib/command'
require_relative 'lib/about'
require_relative 'lib/help'
require_relative 'lib/command_registry'
require_relative 'lib/english_word_list'

class App
  attr_accessor :command

  def initialize
    @command = nil
  end

  def instruction
    <<~END
      ==================================================
      - Введите команду
      - введите 'help' для просмотра доступных команд
      - 'exit' для выхода
      ==================================================
    END
  end

  def work_result
    <<~END
      ==================================================
      #{print '>>'}
      #{command = gets.chomp!}
      #{Command.new.start_command(command)}
      ==================================================
    END
  end

  def start
    while command != 'exit'
      puts instruction
      work_result
    end
  end
end

App.new.start

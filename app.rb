# frozen_string_literal: true

require_relative 'lib/command'
require_relative 'lib/about'
require_relative 'lib/help'
require_relative 'lib/command_registry'
require_relative 'lib/english_word_list'

class App
  attr_reader :registry

  def initialize
    @registry = Command.new.registry
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

  def start
    loop do
      puts instruction
      puts '=================================================='
      print '>>'
      command = gets.chomp!

      if command == 'exit'
        abort
      else
        registry.run_command(command)
      end
      puts '=================================================='
    end
  end
end

App.new.start

# frozen_string_literal: true

require_relative 'lib/command'
require_relative 'lib/about'
require_relative 'lib/help'
require_relative 'lib/command_registry'
require_relative 'lib/english_word_list'

class App
  attr_reader :registry

  def initialize
    @registry = CommandRegistry.new(self)
    @registry.register_command('help', Help)
    @registry.register_command('about', About)
    @registry.register_command('eng-wl', EnglishWordList)
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
      puts '=================================================='
      puts instruction
      print '>>'
      command = gets.chomp!
      abort if command == 'exit'
      registry.run_command(command)
      puts '=================================================='
    end
  end
end

App.new.start

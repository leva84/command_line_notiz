# frozen_string_literal: true

require_relative 'lib/command'
require_relative 'lib/about'
require_relative 'lib/help'
require_relative 'lib/command_registry'
require_relative 'lib/english_word_list'

class App
  attr_reader :command, :registry, :helper

  def initialize
    @command = nil
    @registry = CommandRegistry.new
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
      puts instruction
      puts '=================================================='
      print '>>'
      command = gets.chomp!

      if command == 'exit'
        abort
      elsif command == 'help'
        Help.new.call(registry)
      else
        registry.run_command(command)
      end
      puts '=================================================='
    end
  end
end

App.new.start

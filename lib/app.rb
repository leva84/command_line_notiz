# frozen_string_literal: true

require 'command_registry'
require 'command'
require 'about'
require 'help'
require 'english_word_list'

class App
  PROMPT = '>>'

  attr_reader :registry

  def initialize
    @registry = CommandRegistry.new
    @registry.register_command('help', Help)
    @registry.register_command('about', About)
    @registry.register_command('eng-wl', EnglishWordList)
  end

  def instruction
    <<~END

      - Введите команду
      - введите 'help' для просмотра доступных команд
      - 'exit' для выхода

    END
  end

  def start
    puts instruction
    puts
    loop do
      puts
      print PROMPT
      command = gets.chomp!
      abort if command == 'exit'
      unless registry.command_by_name(command)
        puts 'such command is not registered'
      end
      registry.run_command(command)
    end
  end
end

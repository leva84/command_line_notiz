# frozen_string_literal: true

require 'command_registry'
require 'commands/command'
require 'commands/about'
require 'commands/help'
require 'commands/exit'
require 'commands/english_word_list'

class App
  PROMPT = '>> '

  attr_reader :registry

  def initialize
    @registry = CommandRegistry.new
    @registry.register_command('help', Help)
    @registry.register_command('about', About)
    @registry.register_command('exit', Exit)
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
    loop do
      puts
      print PROMPT
      command = gets.chomp!
      registry.run_command(command)
    end
  end

  def self.start
    new.start
  end
end

# frozen_string_literal: true

require 'command_registry'
require 'commands/command'
require 'commands/about'
require 'commands/help'
require 'commands/exit'
require 'commands/english_word_list'

class App
  PROMPT = '>>'

  def self.registry
    registry = CommandRegistry.new
    registry.register_command('help', Help)
    registry.register_command('about', About)
    registry.register_command('exit', Exit)
    registry.register_command('eng-wl', EnglishWordList)
    registry
  end

  def self.instruction
    <<~END

      - Введите команду
      - введите 'help' для просмотра доступных команд
      - 'exit' для выхода

    END
  end

  def self.start
    registr = registry
    puts instruction
    loop do
      puts
      print PROMPT
      command = gets.chomp!
      abort if command == 'exit'
      unless registr.command_by_name(command)
        puts 'such command is not registered'
      end
      registr.run_command(command)
    end
  end
end

# frozen_string_literal: true

require 'command_registry'
require 'commands/english_word_list'

class App
  PROMPT = '>> '

  attr_reader :registry

  def initialize
    @registry = CommandRegistry.new
    @registry.register_command('eng-wl', Commands::EnglishWordList)
  end

  def instruction
    <<~HEREDOC

      - Введите команду
      - введите 'help' для просмотра доступных команд
      - 'exit' для выхода

    HEREDOC
  end

  def start
    puts instruction
    loop do
      puts
      print PROMPT
      registry.run_command(gets.chomp!)
    end
  end

  def self.start
    new.start
  end
end

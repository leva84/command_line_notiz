# frozen_string_literal: true

class Command
  attr_accessor :commands

  def initialize
    @commands = CommandRegistry.new.hash_commands
  end

  def start_command(command)
    if commands.key?(command)
      commands[command].new.command_work
    elsif command == 'exit'
      'good by'
      abort
    else
      'there is no such command'
    end
  end
end

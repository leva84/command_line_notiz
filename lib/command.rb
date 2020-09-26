# frozen_string_literal: true

class Command
  def initialize
    @hash_com = {}
  end

  def hash_command
    ObjectSpace.each_object(Class).select do |klass|
      @hash_com[klass.new.name_command] = klass if (klass < Command)
    end

    @hash_com
  end

  def start_command(command)
    commands = hash_command

    if commands.key?(command)
      commands[command].new.result_work
    elsif command == 'exit'
      p 'good by'
    else
      p 'there is no such command'
    end
  end
end

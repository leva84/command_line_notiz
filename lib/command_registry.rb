# frozen_string_literal: true

require 'commands/undefined'

class CommandRegistry
  def initialize
    @commands = Hash.new(Undefined.new(self))
  end

  def register_command(command_name, class_name)
    commands[command_name] = class_name.new(self)
  end

  def command_names
    commands.keys.sort
  end

  def command_by_name(name)
    commands[name]
  end

  def run_command(name)
    commands[name].call
  end

  private

  attr_reader :commands
end

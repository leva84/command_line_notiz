# frozen_string_literal: true

require 'commands/undefined'
require 'commands/help'
require 'commands/about'
require 'commands/exit'

class CommandRegistry
  def initialize
    @commands = Hash.new(Commands::Undefined.new(self))
    register_default_commands
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

  def register_default_commands
    register_command('help', Commands::Help)
    register_command('about', Commands::About)
    register_command('exit', Commands::Exit)
  end
end

class CommandRegistry
  def initialize
    @commands = {}
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
    command = commands[name]
    command.call if command
  end

  private

  attr_reader :commands
end

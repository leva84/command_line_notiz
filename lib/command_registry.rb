class CommandRegistry
  def initialize
    @commands = {}
  end

  def register_command(command_name, class_name)
    commands[command_name] = class_name.new
  end

  def commands_names
    commands.each do |command, command_class|
      puts "#{command} - #{command_class.description}"
    end
  end

  def run_command(name)
    command = commands[name]
    command.call if command
  end

  private

  attr_reader :commands
end

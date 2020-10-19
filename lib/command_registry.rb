class CommandRegistry
  attr_reader :app

  def initialize(app)
    @app = app
    @commands = {}
  end

  def commands_class_by_names
    commands.map { |name, class_name| { name: name, class_name: class_name } }
  end

  def register_command(command_name, class_name)
    commands[command_name] = class_name.new(self)
  end

  def run_command(name)
    command = commands[name]
    command.call if command
  end

  private

  attr_reader :commands
end

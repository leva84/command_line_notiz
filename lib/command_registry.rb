class CommandRegistry
  attr_reader :app

  def initialize(app)
    @app = app
    @commands = {}
  end

  def register_command(command_name, class_name)
    commands[command_name] = class_name.new(self)
  end

  def commands_by_names
    commands.each { |name_com, clacc_com| [name_com, clacc_com] }
  end

  def run_command(name)
    command = commands[name]
    command.call if command
  end

  private

  attr_reader :commands
end

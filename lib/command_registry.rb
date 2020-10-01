class CommandRegistry
  attr_accessor :commands

  def initialize
    @commands = {}
  end

  def hash_commands
    ObjectSpace.each_object(Class).select do |klass|
      commands[klass.name_command] = klass if (klass < Command)
    end

    commands
  end
end

class CommandRegistry
  attr_accessor :commands_registry

  def initialize
    @commands_registry = {}
  end

  def hash_commands
    ObjectSpace.each_object(Class).select do |klass|
      @commands_registry[klass.name_command] = klass if (klass < Command)
    end

    @commands_registry
  end
end

# frozen_string_literal: true

class Command
  def initialize
    super
  end

  def self.arr_command
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end

  def create_command(name_command)
    name_command.chomp!
    IO.popen("echo \"class #{name_command.capitalize} < Command\" > lib/#{name_command}.rb")
    IO.popen("echo \"end\" >> lib/#{name_command}.rb")
    IO.popen("echo \"require_relative '#{name_command}'\" >> lib/command.rb")
  end
end
require_relative 'about'

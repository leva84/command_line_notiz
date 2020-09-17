# frozen_string_literal: true

class Command
  def initialize
    super
  end

  def self.hash_command
    hash_com = Hash.new

    ObjectSpace.each_object(Class).select do |klass|
      hash_com[klass.name.to_s.downcase] = klass if (klass < self)
    end

    hash_com
  end

  def self.start_command(command)
    if hash_command.has_key?(command)
      hash_command[command].result_work
    else
      p 'нет такой команды'
    end
  end


  def create_command(name_new_command, description_command, result_of_command_work)
    IO.popen("echo \"class #{name_new_command.capitalize} < Command\" > #{name_new_command}.rb")
    sleep 0.05
    IO.popen("echo \"  def initialize\" >> #{name_new_command}.rb")
    sleep 0.05
    IO.popen("echo \"    super\" >> #{name_new_command}.rb")
    sleep 0.05
    IO.popen("echo \"  end\n\" >> #{name_new_command}.rb")
    sleep 0.05

    IO.popen("echo \"  def self.description\" >> #{name_new_command}.rb")
    sleep 0.05
    IO.popen("echo \"    '#{description_command}'\" >> #{name_new_command}.rb")
    sleep 0.05
    IO.popen("echo \"  end\n\" >> #{name_new_command}.rb")
    sleep 0.05

    IO.popen("echo \"  def self.result_work\" >> #{name_new_command}.rb")
    sleep 0.05
    IO.popen("echo \"    #{result_of_command_work}\" >> #{name_new_command}.rb")
    sleep 0.05
    IO.popen("echo \"  end\" >> #{name_new_command}.rb")
    sleep 0.05

    IO.popen("echo \"end\" >> #{name_new_command}.rb")
    sleep 0.05
    IO.popen("echo \"require_relative '#{name_new_command}'\" >> command.rb")
  end
end

require_relative 'about'
require_relative 'help'

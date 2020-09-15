# frozen_string_literal: true

class Command
  def initialize
    super
  end

  def self.arr_command
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end

  def self.there_is?(command)
    arr_command.map { |com| com.to_s.downcase }.include?(command)
  end

  def self.start_command(command)
    there_is?(command) ? arr_command.each { |com| return com.result_work if com.to_s.downcase == command } : ('такой команды нет')
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
    IO.popen("echo \"    '#{result_of_command_work}'\" >> #{name_new_command}.rb")
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
require_relative 'about'

class Help < Command
  def initialize
    super
  end

  def self.description
    'выводит список доступных команд'
  end

  def self.result_work
    Command.arr_command.each_with_index { |com, ind| p "#{ind + 1}) - \"#{com.name.downcase}\" #{com.description}" }
  end
end

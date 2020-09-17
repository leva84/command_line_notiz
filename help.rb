class Help < Command
  def initialize
    super
  end

  def self.description
    'выводит список доступных команд'
  end

  def self.result_work
    Command.hash_command.each { |com, class_com| p "#{com} - #{class_com.description}" }
  end
end

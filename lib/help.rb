class Help < Command
  def name_command
    'help'
  end

  def description
    'выводит список доступных команд'
  end

  def result_work
    Command.new.hash_command.each { |com, class_com| p "#{com} - #{class_com.new.description}" }
  end
end

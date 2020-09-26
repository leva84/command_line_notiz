class Help < Command
  def name_command
    'help'
  end

  def description
    'выводит список доступных команд'
  end

  def result_work
    self.hash_command.each do |com, class_com|
      p "#{com} - #{class_com.new.description}"
    end
  end
end

class About < Command
  def initialize
    super
  end

  def self.description
    'описание программы и ее окружения'
  end

  def self.result_work
    current_path = File.dirname(__FILE__)
    IO.popen('cat ' + current_path + '/README.md') { |answer| p answer.readlines }
  end
end

class About < Command
  def initialize
    super
  end

  def self.description
    'описание программы и ее окружения'
  end

  def self.result_work
    IO.popen('cat README.md') { |answer| p answer.readlines }
  end
end

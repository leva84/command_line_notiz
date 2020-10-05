class EnglishWordList < Command
  attr_reader :word_list

  def initialize
    current_path = File.dirname(__FILE__)
    file_path = '/date/word_english_list.txt'
    @word_list = File.readlines(current_path + file_path)
  end

  def description
    'программа выводит английские слова и их перевод для изучения'
  end

  def word_hash
    h_words = {}
    word_list.shuffle.each do |string|
      string.chomp!
      string = string.split(' ')
      h_words[string[0].downcase] = string[1..string.size]
    end

    h_words
  end

  def instruction
    <<~END
      ======================================
      Введите перевод на английском
      Введите enter для просмотра перевода
      Введите exit для выхода
      ======================================
    END
  end

  def result_translation(input, word)
    if input == 'exit'
      App.new.start
    elsif input == ''
      puts 'translation of this word:'
      puts word
    elsif input != word
      puts 'It is not right'
      puts 'that is right:'
      puts word
    else
      puts 'Yes!)'
    end
  end

  def words_of_translation
    word_hash.each do |word, translation|
      puts instruction
      puts translation

      input = gets.downcase.chomp

      result_translation(input, word)
    end
  end

  def call(item=nil)
    words_of_translation
  end
end

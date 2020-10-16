class EnglishWordList < Command
  def description
    'программа выводит английские слова и их перевод для изучения'
  end

  def word_list
    File.readlines(current_path + '/date/word_english_list.txt')
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
      registry.app.start
    elsif input == ''
      puts 'translation of this word:', word
    elsif input != word
      puts 'It is not right', 'that is right:', word
    else
      puts 'Yes!)'
    end
  end

  def words_of_translation
    word_hash.each do |word, translation|
      puts instruction
      puts translation
      input = gets.chomp.downcase
      result_translation(input, word)
    end
  end

  def call
    words_of_translation
  end
end

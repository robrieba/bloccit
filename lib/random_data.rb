module RandomData
  def random_name
    first_name = random_word.capitalize
    last_name = random_word.capitalize
    "#{first_name} #{last_name}"
  end

  def random_email
    "#{random_word}@#{random_word}.#{random_word}"
  end
  
  def random_paragraph
    sentences = []
    rand(4..6).times do
      sentences << random_sentence
    end
    sentences.join(" ")
  end

  def random_sentence
    strings = []
    rand(3..8).times do
      strings << random_word
    end
    sentence = strings.join(" ")
    sentence.capitalize << "."
  end

  def random_word
    letters = ('a'..'z').to_a
    letters.shuffle!
    letters[0, rand(3..8)].join
  end

  def random_title
    title = []
    lower_case_words = [ "a",    "an",   "the", "yet",  "so",
                         "from", "and",  "but", "or",   "up",
                         "for",  "nor",  "on",  "at",   "to",
                         "by",   "off",  "on",  "onto", "of",
                         "as" ]

    rand(4..9).times do
      title << random_word.capitalize
      if (rand(2) == 0)
        title << lower_case_words[rand(lower_case_words.length-1)]
      end
    end
    title.last.capitalize!
    title.join(" ")
  end

end

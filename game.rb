class Game
  def initialize(slovo)
    @status = 0
    @letters = get_letters(slovo)

    @good_letters = []
    @bad_letters = []

    @errors = 0
  end

  def get_letters(slovo)
    if slovo == nil || slovo == ''
      abort "нужно ввести слово!"
    end

    return slovo.encode('UTF-8').split('')
  end

  def status
    @status
  end

  def next_step(bukva)
    if @status == -1 || @status == 1
      return
    end
    if @good_letters.include?(bukva) || @bad_letters.include?(bukva)
      return
    end

    if @letters.include?(bukva)
      @good_letters << bukva


      if @good_letters.uniq.sort == @letters.uniq.sort
        @status = 1
      end
    else
      @bad_letters << bukva
      @errors += 1

      if @errors >= 7
        @status = -1
      end
    end
  end

  def ask_next_letter
    print "Введите следущую букву:"
    letter = ''
    while letter == ''
      letter =gets.chomp
    end
    next_step(letter)


  end
  def errors
    @errors
  end
  def letters
    @letters
  end
  def good_letters
    @good_letters
  end


  def bad_letters
    @bad_letters
  end

  def status
    @status
  end
end

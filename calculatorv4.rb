require 'highline/import'

class Calculator

  def user_enter_question
    loop do
      @str1 = ask ('Please enter your equation (enter \'exit program\' to quit):')
      
      # testing for a valid input -- user can exit program by entering 'exit program'
      
      if ((/(plus|minus|divide|divided|multiply|multiplied)/ =~ @str1) == nil && @str1 != "exit program")
        
        puts "Please use a valid operator in your question (plus, minus, divided by, multiplied by)"
      
      #if the input is valid, then break out of the while loop
      
      else
        break
      end
    end
  end
  
  def split_question_into_array(str1)
    # splitting the user's query into separate words delimited by spaces and store into an array in @str2 instance variable
    @str2 = str1.split(" ")
  end
  
  def replace_words_with_operators(str2) #in array
    @str3 = ''  
    #iterating through array, identifying each array element and appending it to str3
    str2.each do |num|
      checking_if_digits(num)
      checking_if_plus(num)
      checking_if_minus(num)
      checking_if_divide(num)
      checking_if_multiply(num)
    end
  end

  def checking_if_digits(num)
    if (/\d+/ =~ num) != nil
      @str3 << num
    end
  end

  def checking_if_plus(num)
    if (/(plus)/ =~ num) != nil
      @str3 << '+'
    end 
  end

  def checking_if_minus(num)
    if (/(minus)/ =~ num) != nil
      @str3 << '-'
    end
  end

  def checking_if_divide(num)
    if (/(divid)/ =~ num) != nil
      @str3 << '/'
    end 
  end

  def checking_if_multiply(num)
    if (/(multipl)/ =~ num) != nil
      @str3 << '*'
    end
  end

  def evaluate_using_updated_operator (str3)
    str3 = str3.delete("?")
    print str3 + ' = '
    #evaluating the string str3
    puts eval(str3)
  end
  
  def calculate_expression
    #method to run the program
    while true  
      user_enter_question
      if @str1 == 'exit program'
        break
      end
      split_question_into_array(@str1)
      replace_words_with_operators(@str2)
      evaluate_using_updated_operator(@str3)
    end
  end
end

question = Calculator.new
question.calculate_expression


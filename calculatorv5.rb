require 'highline/import'

class Calculator

  def user_enter_question
    loop do
      @str1 = ask ('Please enter your equation (enter \'exit program\' to quit):')
      
      # testing for a valid input -- user can exit program by entering 'exit program'
      
      if ((/(plus|minus|divide|divid|multip|times)/ =~ @str1) == nil && @str1 != "exit program")
        
        puts "Please use a valid operator in your question (plus, minus, divided by, multiplied by)"
      
      #if the input is valid, then break out of the loop
      
      else
        break
      end
    end
  end
  
  def convert_words_into_operators(str1)
    #substitutes words with operators
    str1 = str1.gsub(/plus/,"+")
    str1 = str1.gsub(/minus/,"-")
    str1 = str1.gsub(/divid/,"/")
    str1 = str1.gsub(/multip/,"*")
    str1 = str1.gsub(/times/,"*")
    @str2 = str1
  end
  
  def delete_unwanted_words_characters(str2)  
    str2 = str2.delete("a-z") # remove all remaining letters
    str2 = str2.delete("?") # remove any question marks
    str2 = str2.strip.squeeze #remove white space
    @str3 = str2
  end

  def evaluate_using_updated_operator (str3)
    print str3 + ' = '
    #evaluating the string str3 and checking for any other syntax errors due to improper user entry
    begin
      eval(str3)
    rescue SyntaxError
      puts ""
      puts "There is an invalid operator in your calculation"
    else
      puts eval(str3)
      puts
    end
  end
  
  def calculate_expression
    #method to run the program
    while true  
      user_enter_question
      if @str1 == 'exit program'
        break
      end
      convert_words_into_operators(@str1)
      delete_unwanted_words_characters(@str2)
      evaluate_using_updated_operator(@str3)
    end
  end
end

question = Calculator.new
question.calculate_expression


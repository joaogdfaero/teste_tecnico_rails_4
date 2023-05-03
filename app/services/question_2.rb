class TesteTecnico4
  def initialize(str)
    @str = str
    remove_diamantes_e_areias(@str)
  end

  def remove_diamantes_e_areias(str)
    diamond_count = 0
    areia_count  = 0

    puts str

    str.each_char.with_index do |char, index|
      if char == '.'
        areia_count = areia_count + 1
      end

      if index != str.length - 1
        puts str[index] << str[index + 1] #provavelmente o erro é pq ele tenta pegar o depois do último
      end


      #if (str[index] + str[index + 1])  == '<>'
      #  diamond_count = diamond_count + 1
      #end
    end

    str.gsub!(".","")
    str.gsub("<>","")

    puts areia_count
    puts diamond_count
    puts str
  end

end

input = '<<.<<..>><>><.>.>.<<.>.<.>>>><>><>>'
teste = TesteTecnico4.new(input)

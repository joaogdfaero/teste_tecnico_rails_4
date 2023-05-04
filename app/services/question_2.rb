class TesteTecnico4
  def initialize(str)
    @str = str
    remove_diamantes_e_areias(@str)
  end

  def remove_diamantes_e_areias(str)
    diamond_count = 0
    areia_count  = 0

     while str.include?("<>")
      areia_count, diamond_count = count_occurences(areia_count, diamond_count, str)
      remove_strings(str)
     end

    return "Diamantes extraídos = #{diamond_count}, Areias extraídas = #{areia_count}"
  end

  private

  def remove_strings(str)
    str.gsub!(".", "")
    str.gsub!("<>", "")
  end

  def count_occurences(areia_count, diamond_count, str)
    str.each_char.with_index do |char, index|
      if char == '.'
        areia_count = areia_count + 1
      end

      if index != str.length - 1
        if (str[index] << str[index + 1]) == '<>'
          diamond_count = diamond_count + 1
        end
      end

    end
    return areia_count, diamond_count
  end
end

#input = '<<.<<..>><>><.>.>.<<.>.<.>>>><>><>>'
#teste = TesteTecnico4.new(input)


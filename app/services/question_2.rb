class TesteTecnico4
  def initialize(str)
    @str = str
  end

  def remove_diamantes_e_areias
    diamond_count = 0
    areia_count  = 0

     while @str.include?("<>") or @str.include?(".")
       areia_count , diamond_count = count_occurences(areia_count, diamond_count, @str)
       remove_strings
     end

    return "Diamantes extraídos = #{diamond_count}, Areias extraídas = #{areia_count}"
  end

  private

  def remove_strings
    @str.gsub!("<>", "")
    @str.gsub!(".", "")
  end

  def count_occurences(areia_count, diamond_count, str)
    @str.each_char.with_index do |char, index|
      if char == '.'
        areia_count = areia_count + 1
      end

      if index != @str.length - 1
        if (@str[index] << @str[index + 1]) == '<>'
          diamond_count = diamond_count + 1
        end
      end

    end
    return areia_count, diamond_count
  end
end

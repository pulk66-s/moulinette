class Space_Error
    def initialize(lines)
        space_error(lines);
        verify_space(lines);
    end

    def word_before(str, c)
        words = str.split(" ");
        key_words = ["if", "while", "for", "malloc" , "switch", "return"];
        for i in 0..words.size
            if (words[i] != nil)
                if (words[i].include?("("))
                    if (words[i][0] == "(")
                        for j in 0..key_words.size;
                            if (words[i - 1] == key_words[j])
                                return (1);
                            end
                        end
                    else
                        word = (words[i].split("("))[0];
                        for j in 0..key_words.size;
                            if (word == key_words[j])
                                return (1);
                            end
                        end
                    end
                end
            end
        end
        return (0);
    end

    def verify_space(lines)
        for i in 0..lines.size
            if (lines[i] != nil)
                for j in 0..lines[i].size
                    if (lines[i][j] == ",")
                        if (lines[i][j - 1] == " ")
                            puts "L3 Error in line #{i + 1}: you mustn't have a space before a ','";
                        end
                        if (lines[i][j + 1] != " " && lines[i][j + 1] != nil)
                            puts "L3 Error in line #{i + 1}: you must have a space after a ','";
                        end
                    end
                    if (lines[i][j] == "(")
                        if (word_before(lines[i], j) == 0)
                            if (lines[i][j - 1] == " " || lines[i][j + 1] == " ")
                                puts "L3 Error in line #{i + 1}: you mustn't have a space between '('";
                            end
                        else
                            if (lines[i][j - 1] != " ")
                                puts "[WARNIG] : This Error is perhaps fake, check if it's not"
                                puts "L3 Error in line #{i + 1}: When you have a key_words you must have a space before next '('"
                            end
                            if (lines[i][j + 1] == " ")
                                puts "[WARNIG] : This Error is perhaps fake, check if it's not"
                                puts "L3 Error in line #{i + 1}: When you have a key_words you mustn't have a space after next '('"
                            end
                        end
                    end
                    if (lines[i][j] == ")")
                        if (lines[i][j - 1] == " ")
                            puts "L3 Error in line #{i + 1}: you mustn't have a space before ')'";
                        end
                    end
                end
                if (lines[i].include?("for") == true)
                    for j in 0..lines[i].size
                        if (lines[i][j] == ";")
                            if (lines[i][j - 1] != " " || lines[i][j + 1] != " ")
                                puts "L3 Error in line #{i}: you must have a space before and after ';'";
                            end
                        end
                    end
                end
            end
        end
    end


    def space_error(lines)
        i = 0;
        while (i < lines.size)
            if (check_space(lines[i]) == 0)
                puts "Extra space on line #{i  + 1}"
            end
            i += 1;
        end
    end

    def check_space(str)
        if (str == nil)
            return (-1);
        end
        len = str.length;
        while (len > 0)
            if (str[len - 1] != " ")
                return (1);
            else
                return (0);
            end
            len -= 1;
        end
        return (-1);
    end
end

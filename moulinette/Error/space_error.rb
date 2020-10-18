class Space_Error
    def initialize(lines)
        space_error(lines);
        verify_space(lines);
        verify_key_words(lines);
        verify_curly_brackets(lines);
    end

    def verify_curly_brackets(lines)
        for i in 0..lines.size
            if (lines[i] != nil)
                letters = lines[i].split("")
                for j in 0..letters.size
                    if (letters[j] == "{" && j != 0)
                        if (letters[j - 1] != " ")
                            puts "L3 Error in line #{i + 1}: you must have a space before '{'"
                        end
                    end
                end
            end
        end
    end

    def verify_key_words(lines)
        key_words = ["if", "else", "return", "for", "while"]
        for i in 0..lines.size
            if (lines[i] != nil)
                word = lines[i].split(" ");
                for j in 0..word.size - 1
                    for k in 0..key_words.size - 1
                        if (word[j].include?(key_words[k]))
                            if (word[j] != key_words[k])
                                if (!(lines[i].include?("**")))
                                    if (!(word[j].include?("return") && word[j].include?(";")))
                                        puts "L3 Error in line #{i + 1}: you must have a space before '#{key_words[k]}'"
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
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
                words = lines[i].split("");
                operator = ["=", "+", "-", "*", "/", "<", ">", "!", "&", "|", "?"]
                for j in 0..words.size
                    if (operator.include?(words[j]) == true)
                        if (operator.include?(words[j + 1]) == false && operator.include?(words[j - 1]) == false)
                            if (words[j] == "*")
                                if (words[j - 1] != " " || words[j + 1] != " ")
                                    w = lines[i].split(" ")
                                    for a in 0..w.size - 1
                                        if (w[a].include?("*"))
                                            type = ["char", "float", "int", "void", "const"]
                                            if (!(w[a - 1].include?("(")))
                                                if (!(type.include?(w[a - 1])))
                                                    puts "L3 Error in line #{i + 1}: you must have a space before and after '#{words[j]}'"
                                                end
                                            end
                                        end
                                    end
                                end
                            else
                                if (words[j - 1] != " " || words[j + 1] != " ")
                                    if (words[j] != '-')
                                        if (words[j - 1] != "&" && words[j] != "&" && words[j + 1] != "&")
                                            if (words[j - 1] != "!" && words[j] != "!" && words[j + 1] != "!")
                                                if (!(lines[i].include?("include")))
                                                    puts "L3 Error in line #{i + 1}: you must have a space before and after '#{words[j]}'"
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        if (operator.include?(words[j + 1]) == true)
                            unmatch_operator = ["*", "/", "="];
                            if (!(unmatch_operator.include?(words[j]) && unmatch_operator.include?(words[j +1 ]) && (words[j] != "=" && words[j + 1] != "=")))
                                double_operator = ["+", "-"];
                                if (double_operator.include?(words[j]) && double_operator.include?(words[j + 1]))
                                    if (words[j - 1] == " ")
                                        puts "L3 Error in line #{i + 1}: You mustn't have a space before '++' or '--'"
                                    end
                                else
                                    if (words[j - 1] != " " || words[j + 2] != " ")
                                        puts "L3 Error in line #{i + 1}: you must have a space before and after '#{words[j]}#{words[j + 1]}'"
                                    end
                                end
                            end
                        else
                            if (operator.include?(words[j - 1]) == false)
                                if (words[j - 1] != " " || words[j + 1] != " ")
                                    type = ["int", "float", "const", "char", "void"]
                                    words = lines[i].split(" ");
                                    for k in 0..words.size
                                        if (words[k] != nil)
                                            if (words[k].include?("*"))
                                                if (words[k - 1].include?("("))
                                                    word = words[k - 1].split("(");
                                                else
                                                    if (words[k] == "*")
                                                        if (type.include?(words[k - 1]) == true)
                                                            puts "V3 Error in line #{i + 1}: you mustn't have a space between '*' and a pointer"
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                else
                                    if (lines[i].include?("("))
                                        splited = lines[i].split("(")
                                        n = splited[1].split(" ")
                                        for j in 0..n.size - 1
                                            if (n[j] != nil)
                                                type = ["char", "float", "int", "void", "const"]
                                                if (type.include?(n[j]) == true && n[j + 1] == "*")
                                                    puts "V3 Error in line #{i + 1}: you mustn't have a space between '*' and a pointer"
                                                end
                                            end
                                        end
                                    end
                                end
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

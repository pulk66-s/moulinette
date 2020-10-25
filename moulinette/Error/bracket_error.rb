class Bracket
    def initialize(lines)
        verif_bracket(lines);
    end

    def nb_of_indent(lines, line)
        nb_of_spaces = 0;
        j = 0;
        while (lines[line][j] == " ")
            nb_of_spaces += 1;
            j += 1;
        end
        return (nb_of_spaces / 4);
    end

    def one_line_condition(lines, line)
        if (nb_of_indent(lines, line + 1) == nb_of_indent(lines, line + 2))
            return (false);
        end
        return (true);
    end

    def verif_bracket(lines)
        key_words = ["if", "else", "switch", "while", "for"];
        for i in 0..lines.size
            if (lines[i] != nil)
                if (lines[i].include?("{") == true)
                    if (lines[i][0] != "{")
                        words = lines[i].split(" ");
                        error = 1;
                        for j in 0..words.size - 1
                            for k in 0..key_words.size - 1
                                if (words[j].include?(key_words[k]))
                                    error = 0;
                                end
                            end
                        end
                        if (error == 1)
                            if (one_line_condition(lines, i) == false)
                                puts "L4 Error in line #{i + 1}: You have a bad curly bracket placements";
                            end
                        end
                    end
                end
                words = lines[i].split(" ");
                error = 0;
                for k in 0..words.size
                    if (words[k] != nil)
                        if (words[k].include?("else"))
                            if (lines[i].include?("}") == false)
                                error = 1;
                            end
                        end
                    end
                end
                if (error == 1)
                    if (one_line_condition(lines, i) == false)
                        puts "L4 Error in line #{i + 1}: you have a bad curly bracket placements";
                    end
                end
            end
        end
    end
end

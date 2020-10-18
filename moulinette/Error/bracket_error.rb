class Bracket
    def initialize(lines)
        verif_bracket(lines);
    end

    def verif_bracket(lines)
        key_words = ["if", "else", "switch", "while", "for"];
        for i in 0..lines.size
            if (lines[i] != nil)
                if (lines[i].include?("{") == true)
                    if (lines[i][0] != "{")
                        words = lines[i].split(" ");
                        error = 1;
                        for j in 0..words.size
                            if (key_words.include?(words[j]))
                                error = 0;
                            end
                        end
                        if (error == 1)
                            puts "L4 Error in line #{i + 1}: You have a bad curly bracket placements";
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
                    puts "L4 Error in line #{i + 1}: you have a bad curly bracket placements";
                end
            end
        end
    end
end

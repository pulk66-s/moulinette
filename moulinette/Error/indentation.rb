class Indentation
    def initialize(lines)
        verif_indentation(lines);
    end

    def get_nb_space(str)
        i = 0;
        if (str[i] == nil)
            return (0);
        else
            while (str[i] == " ")
                i += 1;
            end
        end
        return (i);
    end

    def verif_indentation(lines)
        for i in 0..lines.size
            if (lines[i] != nil)
                for j in 0..lines[i].size
                    if (lines[i][j] == "\t")
                        puts "L2 Error : indentation error, you have a tab in line #{i + 1} and column #{j + 1}";
                    end
                end
                if (get_nb_space(lines[i]) % 4 != 0)
                    puts "L2 Error in line #{i + 1} you must have a multiple a 4 space to indent."
                end
            end
        end
    end
end

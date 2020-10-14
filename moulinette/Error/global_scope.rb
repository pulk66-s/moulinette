class Global_scope
    def initialize(lines)
        if (verif_header(lines) == 0)
            puts "G1 error : not good header"
        end
        verif_separate_function(lines);
    end

    def verif_separate_function(lines)
        len = lines.length;
        i = 0;
        while (i < len - 1)
            if (lines[i] == "}")
                if (lines[i + 1] == nil)
                    if (lines[i + 2] == nil)
                        puts "G2 error in #{i + 1}: you must have only one empty line between function";
                    end
                else
                    puts "G2 error in #{i + 1}: you must have only one empty line between function"
                end
            end
            i += 1;
        end
    end

    def verif_header(lines)
        if (lines[0] != "/*")
            return (0);
        end
        if (lines[1] != "** EPITECH PROJECT, 2020")
            return (0);
        end
        if (lines[2].start_with?("** ") == false)
            return (0);
        end
        if (lines[3] != "** File description:")
            return (0);
        end
        if (lines[4].start_with?("** ") == false)
            return (0);
        end
        if (lines[5] != "*/")
            return (0);
        end
        return (1);
    end
end

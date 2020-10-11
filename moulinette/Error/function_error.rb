class Function_error
    def initialize(lines)
        verif_nb_lines(lines);
    end
    def verif_nb_lines(lines)
        len = lines.length;
        i = 0;
        j = 0;
        nb_lines = 0;
        good = 0;
        while (i < len)
            if (lines[i] != nil)
                if (lines[i].start_with?("{") == true)
                    j = i;
                    while (j < 22 + i && good == 0)
                        if (lines[j] != nil)
                            if (lines[j].start_with?("}") == true)
                                good = 1;
                            end
                        end
                        nb_lines += 1;
                        j += 1;
                    end
                    if (good == 0)
                        puts "F4 error in #{i}: you have a 20+ lines function";
                    end
                    good = 0;
                end
            end
            i += 1;
        end
    end
end

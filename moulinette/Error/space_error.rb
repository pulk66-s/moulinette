class Space_Error
    def initialize(lines)
        space_error(lines);
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

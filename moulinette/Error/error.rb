require_relative "space_error.rb"
require_relative "global_scope.rb"
require_relative "function_error.rb"
require_relative "indentation.rb"

class Error
    def initialize(fichier)
        lines = get_lines(fichier);
        Space_Error.new(lines);
        Global_scope.new(lines);
        Function_error.new(lines);
        Indentation.new(lines);
    end

    def get_lines(file)
        f_len = file.length
        l = 0;
        i = 0;
        lines = [];
        temp_str = "";
        while (i < f_len)
            if (file[i] == "\n")
                l += 1;
                temp_str = "";
            else
                temp_str += file[i];
                lines[l] = temp_str;
            end
            i += 1;
        end
        return (lines);
    end
end

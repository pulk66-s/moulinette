require_relative "Error/error.rb"

class Moulinette
    def initialize(file)
        fichier = File.open(file, "r").read;
        err = Error.new(fichier);
    end

    def count_lines(file)
        nb_lines = 0;
        i = 0;
        while (i <= file.length)
            if (file[i] == "\n")
                nb_lines += 1;
            end
            i += 1;
        end
        return (nb_lines);
    end
end

mouli = Moulinette.new(ARGV[0]);

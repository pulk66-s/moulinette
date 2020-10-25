def is_text(lines, line, column)
    nb_comment_before = 0;
    i = 0;
    j = 0;
    while (i <= line)
        if (i == line)
            j = 0;
            while (j <= column)
                if (lines[i][j] == "\"" || lines[i][j] == "'")
                    nb_comment_before += 1;
                end
                j += 1;
            end
        else
            if (lines[i] != nil)
                j = 0;
                while (j <= lines[i].size())
                    if (lines[i][j] == "\"")
                        nb_comment_before += 1;
                    end
                    j += 1;
                end
            end
        end
        i += 1;
    end
    if (nb_comment_before % 2 == 1)
        return (true);
    else
        return (false);
    end
end

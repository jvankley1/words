
using DelimitedFiles

words = readdlm("words.txt", '\n', String)
candidates = []

greys = "qeiopasgkcnm"
yellows = [' ', ' ', ' ', ' ', ' ']
greens = [' ', ' ', 'u', ' ', ' ']


function lencheck(word)
    if length(word)==5
        if islowercase(word[1])
            return true
        else
            return false
        end
    else
        return false
    end
end

function greencheck(word, greens)
    for i in 1:5
        if greens[i] != ' '
            if word[i] == greens[i]
                return true
            else
                return false
            end
        end
    end
    return true
end

function greycheck(word, greys)
    len = length(greys)

    for i in 1:len
        if contains(word, greys[i])
            return false
        end
    end

    return true
end

function yellowcheck(word, yellows)


    goods = 0
    for i in 1:5
        if contains(word, yellows[i])

            if word[i] == yellows[i]
                return false
            else
                goods += 1
            end
        end
    end

    return goods
end

for word in words
    if lencheck(word)
        if greycheck(word, greys)
            if greencheck(word, greens)
                y = yellowcheck(word, yellows)
                println(word, "\t", y)
            end
        end
    end
end


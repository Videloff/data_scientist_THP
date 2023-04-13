require_relative "./sources.rb"

def put_rep(list)
    i = 4

    time = list.max_by(&:length).length
    time.times do
        if (list.any?{|word|word.length == i})
            puts ">>>>>>>>> il y a #{list.select{|word|word.length == i}.count} handle(s) de #{i} caractères de long."
        end
        i += 1
    end
end

def is_length(list)
    answer = ""

    while answer != "oui" && answer != "non"
        print ">>>>>>> "
        answer = gets.chomp
    end
    if answer == "oui"
        list = list.sort_by(&:length)
        answer = ""
        puts ">>>>>>> Voulez-vous print la nouvelle liste des handle ?" 
        while answer != "oui" && answer != "non"
            print ">>>>>>> "
            answer = gets.chomp
        end
        if answer == "oui"
            print "\n#{list}\n"
        end
    end
    return list
end

def is_alpha(list)
    answer = ""

    while answer != "oui" && answer != "non"
        print ">>>>>> "
        answer = gets.chomp
    end
    if answer == "oui"
        list = list.sort
        answer = ""
        puts ">>>>>> Voulez-vous print la nouvelle liste des handle ?" 
        while answer != "oui" && answer != "non"
            print ">>>>>> "
            answer = gets.chomp
        end
        if answer == "oui"
            print "\n#{list}\n"
        end
    end
    return list
end

def perform
    handle = handle_array
    save = handle
    
    puts ">> Il y a #{handle.count} handle(s) dans cette array."
    puts ">>> Le handle le plus court est : #{handle.min_by(&:length)}."
    puts ">>>> Il y a #{handle.select{|word|word.length == 6 }.count} handle(s) contenant 5 caractères."
    puts ">>>>> Il y a #{handle.select{|word|word=~/^@[A-Z]/}.count} handle(s) dont le nom commence par une majuscule."
    puts ">>>>>> Voulez-vous trier les handles par ordre alphabétique ? oui/non"
    handle = is_alpha(handle)
    puts ">>>>>> Les handles ont été trié par ordre alphabétique"
    puts ">>>>>>> Voulez-vous trier les handles par ordre croissant? oui/non"
    handle = is_length(handle)
    puts ">>>>>>> Les handles ont été trié par ordre croissant"
    puts ">>>>>>>> La position de @epenser est la #{handle.index('@epenser')}"
    put_rep(handle)
end

perform
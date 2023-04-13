require_relative "./sources.rb"

def print_inf(value)
    answer = ""

    print ">>> Voulez-vous print les crypto dans les valeurs sont inférieur à 6000 ? (oui/non)\n"
    while answer != "oui" && answer != "non"
        print ">>> "
        answer = gets.chomp
    end
    if answer == "oui"
        print "Hash(value, value) = "
        print value
        print "\n"
    end
end

def print_crypto(firm)
    answer = ""

    print "> les listes ont été fusionnées en Hash.\n> Voulez-vous print le résultat ? (oui/non)\n"
    while answer != "oui" && answer != "non"
        print "> "
        answer = gets.chomp
    end
    if answer == "oui"
        print "Hash(firm, value) = "
        print firm
        print "\n"
    end
end

def perform
    firm = firm_array
    price = price_array

    crypto = Hash[firm.zip(price.map(&:to_f))]
    #puts crypto.is_a?(Hash)
    print_crypto(crypto)
    puts ">> le crypto qui a la plus grande valeur est = #{crypto.select{|key, value|value == crypto.values.max}}"
    puts ">> les cryptos qui ont les plus petites valeurs sont = #{crypto.select{|key, value|value == crypto.values.min}}"
    inferior = crypto.select{|key, value|value < 6000.0}
    print_inf(inferior)
    inferior = crypto.select{|key, value|value < 6000.0}.max_by(&:last)
    print_inf(inferior)
end

perform
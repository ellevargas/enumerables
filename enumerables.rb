##################################
#####       Enumerables      #####
##################################

  #Enumerable is a module that is mixed in to both Array and Hash (and a couple other classes too, but those are the main ones).

##################################
#####     LEARNING GOALS     #####
##################################

# Recap object composition

# Try out a Ruby mixin

# Learn about the module Enumerable

# Discover some really, really useful methods provided by Enumerable



##################################
#####    USING MODULES TO    #####
#####      MAKE MIXINS       #####
##################################

 # Mixin is a collection of methods in a module that is composed into a Ruby class via either include (for instance methods) or extend (for class methods).

          ######################################
          ##  Dynamically extend String class ##
          ######################################

          #Ruby classes can by dynamically extended, meaning that, at any point after it is declared, a class can be re-opened and modified.

          class String # <= wat?!? We can do this? We sure can!
            def smiley_spaces
              self.gsub(/\s+/, " :) ")
            end
          end

          ####################
          ##Our First Mixin!##
          ####################

          module AllSmiles
            def to_smile
              ":)" * length
            end
          end

          class String
            include AllSmiles
          end

          class Array
            include AllSmiles
          end

##################################
#####       ENUMERABLES      #####
##################################

        ####################
        ## Map & Collect ##
        ####################

        #These do the same thing. The iterate the collection and return an array of the results of the block evaluation.

        #USING EACH
          # results = []
          # [1,2,3].each { |n| results << n ** 2 }
          # results

        #USING MAP OR COLLECT
          # results = [1,2,3].collect { |n| n ** 2 }
          # results



        ####################
        ## sort & sort_by ##
        ####################
        # Returns an array containing the items sorted by either their own method, or by using the results of the supplied block.


        # [1, 3, 6, 3, 2, 346, 6, 7].sort # => [1, 2, 3, 3, 6, 6, 7, 346]


        # Product.all.sort_by do |product|
        #   product.margins_average_year_over_year(adjust_for_inflation: true)
        # end


        #Note: Use sort when the sorting calculation/algorithm is inexpensive, in terms of memory required and/or objects allocated. Use sort_by when the calculation/algorithm is expensive. sort_by uses a Schwartzian Transform to minimize the cost of sorting things that require expensive caluclations. Err on the side of using sort unless you explicitely identify it as a performance bottleneck.

        #####################
        ##    min, max,    ##
        ## min_by & max_by ##
        #####################
        #These methods find the maximum and minimum values in a collection. You can use max and min if a collection's values can be directly compared (i.e., they are all Float and Fixnum values).

        #numbers = (1..100).to_a.sample(15)

        #FINDING MAX WITH EACH
          # max = 0
          # numbers.each do |num|
          #   max = num if num > max
          # end

        #USING MAX AND MIN
          # numbers.max
          # numbers.min


        #If the values are not directly comparable, the min_by and max_by do similar work but take a block in which you can derive the values to compare:

          # least = Bank::Account.all.min_by { |account| account.balance }
          # most  = Bank::Account.all.max_by { |account| account.balance }


        #####################
        ## select & reject ##
        #####################

        # Use these methods to filter collections by a conditional evaluation.

        #Select will filter for elements where the condition is true.
          #(1..100).to_a.select {|n| n % 10 == 0 }
          
       #Reject filters for elements where the condition is false.
          #(1..15).to_a.reject { |n| n % 5 == 0 }

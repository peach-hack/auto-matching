module AutoMatching
  module Converter
    class ConverterBase
      def convert_to_generation(age)
        if age < 20
          "18-19歳"
        elsif age < 24
          "20代前半"
        elsif age < 27
          "20代半ば"
        elsif age < 30
          "20代後半"
        elsif age < 34
          "30代前半"
        elsif age < 37
          "30代半ば"
        elsif age < 40
          "30代後半"
        elsif age < 44
          "40代前半"
        elsif age < 47
          "40代半ば"
        elsif age < 50
          "40代後半"
        elsif age < 54
          "50代前半"
        elsif age < 57
          "50代半ば"
        elsif age < 60
          "50代後半"
        else
          "60歳以上"
        end
      end
    end
  end
end

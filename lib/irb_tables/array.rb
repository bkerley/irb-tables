module IrbTables
  module Array
    def self.included(base)
      base.class_eval do
        alias_method :inspect, :inspect_with_table
      end
    end
    def inspect_with_table
      "[\n" +
        self.map{ |e| e.inspect }.join("\n") +
        "\n]"
    end
  end
end
class Array
  include IrbTables::Array
end

module IrbTables
  module Array
    def self.included(base)
      base.class_eval do
        alias_method :inspect, :inspect_with_table
      end
    end
    def inspect_with_table
      case self.length
      when 0
        "[]"
      when 1
        "[#{self.first.inspect}]"
      when 2..1000
        self.inspect_as_pretty_table
      else
        self.inspect_as_separate_rows
      end
    end

    def inspect_as_separate_rows
      "[\n" +
        self.map{ |e| e.inspect }.join("\n") +
        "\n]"
    end
    def inspect_as_pretty_table
      if (!defined? ActiveRecord::Base) ||
          (self.map{ |e| e.class }.uniq.length > 1) ||
          (!self.first.class.ancestors.include? ActiveRecord::Base)
        return inspect_as_separate_rows
      end
      template = self.first
      columns = template.class.columns.map do |c|
        length = case c.type
                 when :integer
                   8
                 when :boolean
                   5
                 when :string
                   [32, c.limit || 32].min
                 when :text
                   [64, c.limit || 64].min
                 else
                   16
                 end
        fmt = " %#{length}s "
        [c.name, length, fmt]
      end
      out = columns.map do |c|
        c[2] % c[0]
      end.join('|')
      out << "\n"
      out << '-'*(columns.inject(0){ |m, o| m + o[1] + 3 })
      out << "\n"
      out << self.map do |e|
        columns.map do |c|
          content = e.send(c[0]).to_s
          if content.length > c[1]
            content = content[0..(c[1] - 4)] + '...'
          end
          c[2] % content
        end.join('|')
      end.join("\n")
    end
  end
end
class Array
  include IrbTables::Array
end

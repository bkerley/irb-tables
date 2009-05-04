%w{ array }.each do |f|
  require "#{ File.dirname(__FILE__) }/irb_tables/#{ f }"
end
module IrbTables
end

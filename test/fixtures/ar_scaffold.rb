require 'active_record'
ActiveRecord::Base.establish_connection(
                                        :adapter=>'sqlite3',
                                        :dbfile=>':memory:'
                                        )
ActiveRecord::Schema.define do
  create_table :mugs do |t|
    t.column :name, :string
    t.column :description, :text
    t.column :mass, :decimal
    t.column :quantity, :integer
    t.column :insulated, :boolean
  end
end
class Mug < ActiveRecord::Base
end
[
 { :name=>'initech', :description=>'office space themed', :mass=>5.1, :quantity=>1, :insulated=>false},
 { :name=>'blue', :description=>'a big blue mug from target', :mass=>3, :quantity=>1, :insulated=>true},
 { :name=>'ikea dinera', :description=>'a small bluish-green mug', :mass=>3, :quantity=>6, :insulated=>false}
].each{ |h| Mug.create h }

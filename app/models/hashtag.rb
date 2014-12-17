require 'pg'

class Hashtag < ActiveRecord::Base
  has_and_belongs_to_many :tiks

  def self.put(tik, set)
    for input in set
      len = input.length
      hashtag_value = input[1..len]
      hashtag = Hashtag.find_by value:hashtag_value

      if hashtag.nil?
        hashtag = Hashtag.create(value:hashtag_value)
        hashtag.save
      end

      conn = PG::Connection.open(:dbname => 'hashtalk_development', :user => 'hashtalk', :password => 'password1')
      res = conn.exec_params('insert into hashtags_tiks values ($1, $2)', [tik[:id], hashtag[:id]])

    end
  end

end

require 'pg'

class Tik < ActiveRecord::Base
  belongs_to :user
  has_many :activities
  has_and_belongs_to_many :hashtags

  def self.put(value)
    time = Time.now
    conn = PG::Connection.open(:dbname => 'hashtalk_development', :password => 'password1', :user => 'hashtalk')
    res = conn.exec('insert into tiks (user_id, value, created_at, updated_at) values (1, $1, $2, $2)', [value, time])
  end

  def self.get(params)
    conn = PG::Connection.open(:dbname => 'hashtalk_development', :password => 'password1', :user => 'hashtalk')
    res = conn.exec('select * from tiks')
    return res
  end


end

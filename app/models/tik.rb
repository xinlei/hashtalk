require 'pg'

class Tik < ActiveRecord::Base
  belongs_to :user
  has_many :activities
  has_and_belongs_to_many :hashtags
  validates :value, presence: true

  def self.put(value)
    time = Time.now
    tik = Tik.create(user_id: 1, value: value, created_at: time, updated_at:time)
    tik.save
  end

  def self.get(params)
    res = Tik.all
    return res
  end


end

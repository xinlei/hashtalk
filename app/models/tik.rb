class Tik < ActiveRecord::Base
  belongs_to :user
  has_many :activities
  has_and_belongs_to_many :hashtags
  validates :value, presence: true

  def self.put(value)
    time = Time.now
    tik = Tik.create(user_id: 1, value: value, created_at: time, updated_at:time)
    tik.save
    return tik
  end

  def self.get(params)
    puts 'params for get'
    tiks = nil
    if params.nil?
      tiks = Tik.all
    else
      input = []
      for param in params
        input << param[1..param.length]
      end

      puts input
      puts input.length

      tiks = Tik.joins(:hashtags).select("tiks.id, tiks.value").where("hashtags.value = ?", input[0])
      result = []
      if input.length > 1

        puts 'hi world'

        for i in 1..input.length - 1
          result << Tik.joins(:hashtags).select("tiks.id, tiks.value").where("hashtags.value = ?", input[i])
        end

        sql = tiks.to_sql

        for i in 0..result.length - 1
          sql = sql + " INTERSECT " + result[i].to_sql
          puts i
        end
        Tik.find_by_sql sql
      else
        return tiks
      end
    end
  end
end

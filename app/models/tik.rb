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
    tiks = nil
    if params.nil?
      tiks = Tik.all
    else
      input = []
      for param in params
        input << param[1..param.length]
      end

      tiks = Tik.joins(:hashtags).select("tiks.id, tiks.value").where("hashtags.value = ?", input[0])
      for i in 1..input.length
        if input.length > 1
          temp = Tik.joins(:hashtags).select("tiks.id, tiks.value").where("hashtags.value = ?", input[i])
          tiks.merge(temp)
        end
      end

      for tik in tiks do
        puts tik[:value]
      end
    end
    return tiks
  end
end

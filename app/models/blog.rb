class Blog < ApplicationRecord
  # エラー原因: has_manyに対して単数系出会った
  # 修正の意図: Fix type (comments => comment)
  has_many :comments

  validates :title, presence: true
  validates :content, presence: true
end

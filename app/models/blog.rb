class Blog < ApplicationRecord
  # エラー原因: has_manyに対して単数系出会った
  # 修正の意図: Fix type (comments => comment)

  # エラー原因: dependentの記述がない
  # 修正の意図: Fix add (dependent: :destroy)
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
end

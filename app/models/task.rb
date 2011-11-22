class Task < ActiveRecord::Base
  attr_accessible :person_id, :task, :due_date, :category, :private, :completed
  # belongs_to :person
  belongs_to :user
  
  scope :all, order('due_date ASC')
  scope :overdue, lambda { where('due_date < ?', Date.today) }
  scope :due_this_week, lambda { where("due_date BETWEEN ? AND ?", Date.today, Date.today + 7.days ) }
  scope :due_older, lambda { where('due_date >= ?', Date.today + 8.days) }
end

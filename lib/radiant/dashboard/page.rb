module Radiant::Dashboard::Page
  def self.included(base)
    base.class_eval {
      named_scope :drafts, :conditions => ['status_id = ?',Status['Draft'].id]
      named_scope :reviewed, :conditions => ["status_id = ?", Status['Reviewed'].id ]
      named_scope :published, :conditions => ["status_id = ?", Status['Published'].id ]
      named_scope :recently_updated, lambda{{:conditions => ['updated_at > ?', 1.week.ago ], :order => 'updated_at DESC'}}
      named_scope :by_updated, :order => 'updated_at DESC'

      named_scope :latest, lambda { |limit| {:order => "updated_at DESC, created_at DESC", :limit => limit}}
    }
  end
end

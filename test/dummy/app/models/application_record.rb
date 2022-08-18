class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  include IncludesLookahead::Concern
end

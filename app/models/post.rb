class Post < ApplicationRecord

  after_create_commit -> { broadcast_prepend_to 'posts' }

end

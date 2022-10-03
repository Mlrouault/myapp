class User < ApplicationRecord
    # belongs_to :client
    has_secure_password
end

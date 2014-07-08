Rails.application.config.middleware.use OmniAuth::Builder do
  provider :cobot, 'c5787a5c285ad5fc4d0ae7b6d68419f1', '9014df3bde9065958fd79371e8da2af5e3c36c49bce27a5dc2de3aeafa8e519c', scope: 'read write'
end
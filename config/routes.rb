Rails.application.routes.draw do
  root "chats#show"
  get "/manifest.json", to: "manifests#show"
  mount ActionCable.server => '/cable'

end

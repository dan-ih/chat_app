Rails.application.routes.draw do
  root "chats#show"
  get '(:anycable_id)', to: 'chats#show', as: :chat, constraints: { anycable_id: /\d+/ }
  get "/manifest.json", to: "manifests#show"
  mount ActionCable.server => '/cable'

end
